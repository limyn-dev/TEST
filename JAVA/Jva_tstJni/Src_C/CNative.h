/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class CNative */

#ifndef _Included_CNative
#define _Included_CNative
#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT jint    JNICALL Java_tstjni_CNative_SumInteger    (JNIEnv *env, jclass cls, jint a, jint b);
JNIEXPORT jstring JNICALL Java_tstjni_CNative_SumString     (JNIEnv *env, jclass cls, jstring jStrA, jstring jStrB);
JNIEXPORT void    JNICALL Java_tstjni_CNative_WriteMyInt    (JNIEnv *env, jobject obj);
JNIEXPORT void    JNICALL Java_tstjni_CNative_CallMyFunction(JNIEnv *env, jobject obj, jint nbCall);

#ifdef __cplusplus
}
#endif

void wrtMsg(char* str) ;

#endif
