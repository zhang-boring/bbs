package bbs.game.cn.bbs.utils;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class ModifyEntityUtil {
    public static void getModified(Object old, Object now) {
        Class clazz = old.getClass();
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);

            try {
                if (getter(now, field, clazz) == null) {
                    setter(now, field, clazz, getter(old, field, clazz));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 参数的getter方法
     * @param field
     * @param clazz
     * @param <T>
     * @return
     * @throws IntrospectionException
     */
    private static <T> T getter(Object obj, Field field, Class clazz) throws Exception {
        PropertyDescriptor propertyDescriptor = new PropertyDescriptor(field.getName(), clazz);
        Method method = propertyDescriptor.getReadMethod();
        return (T) method.invoke(obj);
    }

    /**
     * 参数的setter方法
     * @param obj
     * @param field
     * @param clazz
     * @param value
     * @param <F>
     * @throws Exception
     */
    private static <F> void setter(Object obj, Field field, Class clazz, F value) throws Exception {
        PropertyDescriptor propertyDescriptor = new PropertyDescriptor(field.getName(), clazz);
        Method method = propertyDescriptor.getWriteMethod();
        method.invoke(obj, value);
    }
}
