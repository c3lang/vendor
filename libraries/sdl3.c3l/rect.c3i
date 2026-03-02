
module sdl3;

// Structs
struct Point {
  int x,y;
}
struct Rect {
  int x,y;
  int w,h;
}
struct FPoint {
  float x,y;
}
struct FRect {
  float x,y;
  float w,h;
}

// Functions
extern fn bool getRectAndLineIntersection(Rect* rect, int* x1, int* y1, int* x2, int* y2) @extern("SDL_GetRectAndLineIntersection");
extern fn bool getRectAndLineIntersectionFloat(FRect* rect, float* x1, float* y1, float* x2, float* y2) @extern("SDL_GetRectAndLineIntersectionFloat");
extern fn bool getRectEnclosingPoints(Point* points, int count, Rect* clip, Rect* result) @extern("SDL_GetRectEnclosingPoints");
extern fn bool getRectEnclosingPointsFloat(FPoint* points, int count, FRect* clip, FRect* result) @extern("SDL_GetRectEnclosingPointsFloat");
extern fn bool getRectIntersection(Rect* a, Rect* b, Rect* result) @extern("SDL_GetRectIntersection");
extern fn bool getRectIntersectionFloat(FRect* a, FRect* b, FRect* result) @extern("SDL_GetRectIntersectionFloat");
extern fn bool getRectUnion(Rect* a, Rect* b, Rect* result) @extern("SDL_GetRectUnion");
extern fn bool getRectUnionFloat(FRect* a, FRect* b, FRect* result) @extern("SDL_GetRectUnionFloat");
extern fn bool hasRectIntersection(Rect* a, Rect* b) @extern("SDL_HasRectIntersection");
extern fn bool hasRectIntersectionFloat(FRect* a, FRect* b) @extern("SDL_HasRectIntersectionFloat");
extern fn bool pointInRect(Point* p, Rect* r) @extern("SDL_PointInRect");
extern fn bool pointInRectFloat(FPoint* p, FRect* r) @extern("SDL_PointInRectFloat");
extern fn bool rectEmpty(Rect* r) @extern("SDL_RectEmpty");
extern fn bool rectEmptyFloat(FRect* r) @extern("SDL_RectEmptyFloat");
extern fn bool rectsEqual(Rect* a, Rect* b) @extern("SDL_RectsEqual");
extern fn bool rectsEqualEpsilon(FRect* a, FRect* b, float epsilon) @extern("SDL_RectsEqualEpsilon");
extern fn bool rectsEqualFloat(FRect* a, FRect* b) @extern("SDL_RectsEqualFloat");
extern fn void rectToFRect(Rect* rect, FRect* frect) @extern("SDL_RectToFRect");

