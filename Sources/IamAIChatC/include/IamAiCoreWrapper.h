#ifndef IamAiCoreWrapper_h
#define IamAiCoreWrapper_h
#ifdef __cplusplus
extern "C" {
#endif
    const char *iamai_generate(const char *prompt);
    void       iamai_free(char *ptr);
#ifdef __cplusplus
}
#endif
#endif /* IamAiCoreWrapper_h */
