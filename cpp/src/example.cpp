#include <android/log.h>
#include <gmp.h>
#include <sstream>


#define LOG_TAG "ExampleFunction"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)


extern "C" void example_function() {
    LOGI("example_function called");

    mpz_t a, b, result;
    mpz_init_set_str(a, "1234", 10);
    mpz_init_set_str(b, "5678", 10);
    mpz_init(result);

    mpz_add(result, a, b);

    // Convert GMP result to a string
    char *result_str = mpz_get_str(NULL, 10, result);
    LOGI("Calculation result: %s", result_str);

    // Free the memory allocated by mpz_get_str
    free(result_str);

    mpz_clear(a);
    mpz_clear(b);
    mpz_clear(result);
}