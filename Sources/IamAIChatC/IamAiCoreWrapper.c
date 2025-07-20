#include "IamAiCoreWrapper.h"
#include <stdlib.h>
#include <string.h>

const char *iamai_generate(const char *prompt) {
    // Placeholder implementation that echoes the prompt.
    char *response = strdup(prompt);
    return response;
}

void iamai_free(char *ptr) {
    free(ptr);
}
