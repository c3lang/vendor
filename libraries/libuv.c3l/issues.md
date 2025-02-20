# Issues
- @if(!env::WIN32) for UNIX fields, which is not great. Consider adding @if(env::UNIX)
- double as C3 type, not C. Needs to be checked for bugs

# Todoes
- Port all tests from libuv GitHub to test bindings
- Check if fields order is neceserry for libuv to work properly. If not, consider simplifying dublicate fields for multiple platforms
- UV_PLATFORM_SEM_t for all platforms. Currently is CLong which is not correct
- Implement ipv6