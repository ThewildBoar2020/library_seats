package dingzhen.aop;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.AfterReturning;  
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import dingzhen.entity.Log;
import dingzhen.entity.User;
import dingzhen.service.LogService;
import dingzhen.util.StringUtil;
import dingzhen.util.TimeUtil;

/**
 * 操作日志拦截。拦截所有service层中的的add和update开头的方法
 */
@Aspect
public class LogAspect {
	
	@Autowired
	private LogService<Log> logService;
	
	/** 
     * 添加业务逻辑方法切入点 
     */ 
	@Pointcut("execution(* dingzhen.service.*.add*(..))")  
	public void addServiceCall() { }  
	
	/** 
     * 修改业务逻辑方法切入点 
     */  
    @Pointcut("execution(* dingzhen.service.*.update*(..))")  
    public void updateServiceCall() { }  
    
    
    /** 
     * 删除业务逻辑方法切入点 
     * 此处拦截要拦截到具体的莫一个模块
     * 如deleteUser方法。则删除user的时候会记录日志
     * deleteRole时删除role会记录日志
     */  
    @Pointcut("execution(* dingzhen.service.*.delete*(..))")  
    public void deleteServiceCall() { }  
      
	
    /** 
     * 管理员添加操作日志(后置通知) 
     * @param joinPoint 
     * @param rtv 
     * @throws Throwable 
     */  
    @AfterReturning(value="addServiceCall()", argNames="rtv", returning="rtv")  
    public void insertServiceCallCalls(JoinPoint joinPoint, Object rtv) throws Throwable{  
    	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    	User currentUser = (User) request.getSession().getAttribute("currentUser");
        //判断参数  
        if(joinPoint.getArgs() == null){//没有参数  
            return;  
        }  
        //获取方法名  
        //String methodName = joinPoint.getSignature().getName();  
        String className = joinPoint.getArgs()[0].getClass().getName();
        //获取操作内容  
		className = className.substring(className.lastIndexOf(".") + 1);
        String opContent = adminOptionContent(joinPoint.getArgs(), "添加");  
         
        //创建日志对象  
        Log log = new Log();
        log.setModule(className.toLowerCase());
        try {
        	 log.setUserName(currentUser.getUserName()); 
		} catch (Exception e) {
			log.setUserName("开发者");
		}
        log.setCreateTime(TimeUtil.formatTime(new Date(),"yyyy-MM-dd HH:mm:ss"));//操作时间  
        log.setContent(opContent);//操作内容  
        log.setOperation("添加");//操作
        log.setIp(getIpAddr(request));
        logService.insertLog(log);
    }  
    
    
    
    
    /** 
     * 管理员修改操作日志(后置通知) 
     * @param joinPoint 
     * @param rtv 
     * @throws Throwable 
     */ 
    @AfterReturning(value="updateServiceCall()", argNames="rtv", returning="rtv")  
    public void updateServiceCallCalls(JoinPoint joinPoint, Object rtv) throws Throwable{  
    	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    	User currentUser = (User) request.getSession().getAttribute("currentUser");
       
          
        //判断参数  
        if(joinPoint.getArgs() == null){//没有参数  
            return;  
        }  
        //获取方法名  
        String className = joinPoint.getArgs()[0].getClass().getName();
		className = className.substring(className.lastIndexOf(".") + 1);
        //获取操作内容  
        String opContent = adminOptionContent(joinPoint.getArgs(), "修改");  
        Log log = new Log();  
        log.setModule(className.toLowerCase());
        log.setUserName(currentUser.getUserName()); 
        log.setCreateTime(TimeUtil.formatTime(new Date(),"yyyy-MM-dd HH:mm:ss"));//操作时间  
        log.setContent(opContent);//操作内容  
        log.setOperation("修改");//操作
       
         //logService.insertLog(log);//添加日志  
         
    }  
    
    
	/**
	 * 使用Java反射来获取被拦截方法(insert、update)的参数值， 将参数值拼接为操作内容
	 */
	public String adminOptionContent(Object[] args, String type) throws Exception {
		if (args == null) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		Object info = args[0];
		String className = info.getClass().getName();
		className = className.substring(className.lastIndexOf(".") + 1);
		sb.append(type+className+" 属性名和值：");
		// 获取对象的所有方法
		Method[] methods = info.getClass().getDeclaredMethods();
		// 遍历方法，判断get方法
		for (Method method : methods) {
			String methodName = method.getName();
			// 判断是不是get方法
			if (methodName.indexOf("get") == -1) {// 不是get方法
				continue;// 不处理
			}
			Object rsValue = null;
			try {
				// 调用get方法，获取返回值
				rsValue = method.invoke(info);
				if (rsValue == null) {// 没有返回值
					continue;
				}
			} catch (Exception e) {
				continue;
			}
			// 将值加入内容中
			sb.append(" " + methodName.substring(3) + "-->" + rsValue + "  ");
		}
		return sb.toString();
	}
	
	 /** 
     * 管理员删除XX操作(环绕通知)，使用环绕通知的目的是 
     * 在XX被删除前可以先查询出影片信息用于日志记录
     * 删除操作参数是ID，所以要指定模块。
     * 在上面的aop拦截中，拦截具体的莫一个模块的删除方法。 
     * @param joinPoint 
     * @param rtv 
     * @throws Throwable 
    
    @Around(value="deleteFilmCall()", argNames="rtv")  
    public Object deleteFilmCallCalls(ProceedingJoinPoint pjp) throws Throwable {  
          
        Object result = null;  
         //环绕通知处理方法  
         try {  
              
            //获取方法参数(被删除的影片id)  
            Integer id = (Integer)pjp.getArgs()[0];  
            Film obj = null;//影片对象  
            if(id != null){  
                //删除前先查询出影片对象  
                obj = filmService.getFilmById(id);  
            }  
              
            //执行删除影片操作  
            result = pjp.proceed();  
              
            if(obj != null){  
                  
                //创建日志对象  
                Log log = new Log();  
                log.setUserid(logService.loginUserId());//用户编号  
                log.setCreatedate(new Date());//操作时间  
                  
                StringBuffer msg = new StringBuffer("影片名 : ");  
                msg.append(obj.getFname());  
                log.setContent(msg.toString());//操作内容  
                  
                log.setOperation("删除");//操作  
                  
                logService.log(log);//添加日志  
            }  
              
         }  
         catch(Exception ex) {  
            ex.printStackTrace();  
         }  
           
         return result;  
    }  
    
     */  
    
	/**
	 * 反射获得对象信息
	 * @param o
	 * @return
	 */
	public static String getFieldsInfo(Object o){
		Field[] fields = o.getClass().getDeclaredFields();
		//String[] fieldNames = new String[fields.length];
		StringBuffer sb = new StringBuffer("属性名和值:");
		/**
		 * 遍历所有字段
		 * 从下标1开始
		 * 把0位置的serialVersionUID过滤掉
		 * 所以要求实体类的第一个属性都是serial*UID
		 */
		for (int i = 1; i < fields.length; i++) {    
			sb.append(fields[i].getName()+ "-->"+getFieldValueByName(fields[i].getName(), o)+"  ");
			/**infoMap = new HashMap();
			infoMap.put("type",fields[i].getType().toString());
			infoMap.put("name",fields[i].getName());
			infoMap.put("value", getFieldValueByName(fields[i].getName(), o));
			list.add(infoMap);*/
		}
		return sb.toString();
	}
	
	
	
    
	/**
	 * 通过反射
	 * 根据字段名称获取字段值
	 * @param fieldName
	 * @param o
	 * @return
	 */
	private static Object getFieldValueByName(String fieldName,Object o){
		try {
			String firstLetter = fieldName.substring(0, 1).toUpperCase();   //手写字母大写
			String getter = "get" + firstLetter + fieldName.substring(1);   // get方法
			Method method = o.getClass().getMethod(getter,new Class[]{});
			Object object = method.invoke(o, new Object[]{});
			return object;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	/**
	 * 反射获得字段值
	 * @param o
	 * @return
	 */
	@SuppressWarnings("unused")
	private static String[] getFieldName(Object o){
		Field[] fields = o.getClass().getDeclaredFields();
		String[] fieldNames = new String[fields.length];
		for (int i = 0; i < fieldNames.length; i++) {
			fieldNames[i] = fields[i].getName();
		}
		return fieldNames;
	}
 
    
 
    
    /**
	 * 获取访问者IP
	 * 
	 * 在一般情况下使用Request.getRemoteAddr()即可，但是经过nginx等反向代理软件后，这个方法会失效。
	 * 
	 * 本方法先从Header中获取X-Real-IP，如果不存在再从X-Forwarded-For获得第一个IP(用,分割)，
	 * 如果还不存在则调用Request .getRemoteAddr()。
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) throws Exception{
		String ip = request.getHeader("X-Real-IP");
		if (!StringUtil.isEmpty(ip) && !"unknown".equalsIgnoreCase(ip)) {
			return ip;
		}
		ip = request.getHeader("X-Forwarded-For");
		if (!StringUtil.isEmpty(ip) && !"unknown".equalsIgnoreCase(ip)) {
			// 多次反向代理后会有多个IP值，第一个为真实IP。
			int index = ip.indexOf(',');
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		} else {
			return request.getRemoteAddr();
		}
	}
	
    
    
    
    
	
}
