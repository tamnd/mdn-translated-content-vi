---
title: "PerformanceScriptTiming: invoker property"
short-title: invoker
slug: Web/API/PerformanceScriptTiming/invoker
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceScriptTiming.invoker
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`invoker`** của giao diện {{domxref("PerformanceScriptTiming")}} trả về một giá trị chuỗi cho biết danh tính của tính năng mà khi được gọi, đã chạy tập lệnh.

## Giá trị

Một chuỗi, có cấu trúc phụ thuộc vào giá trị {{domxref("PerformanceScriptTiming.invokerType")}} của tập lệnh:

| `invokerType`                               | Cấu trúc chuỗi `invoker`                                                                                                                                                                                                                            | Ví dụ                                                                                               |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `"user-callback"`                           | Tên lớp đối tượng chứa hàm được định nghĩa, theo sau là dấu chấm, theo sau là tên hàm.                                                                                                                                                              | `"Window.requestAnimationFrame"`, `"Window.setTimeout"`                                             |
| `"event-listener"`                          | {{domxref("Element.tagName", "tagName")}} của phần tử, theo sau là dấu thăng và `id` của nó (`#id`) hoặc `src=` và giá trị `src` trong dấu ngoặc vuông (`[src=url]`) nếu không có `id`, theo sau là dấu chấm, theo sau là thuộc tính xử lý sự kiện. | `"IMG#hero.onload"`, `"IMG[src=https://example.com/img.jpg].onload"`, `"BUTTON#updateCart.onclick"` |
| `"resolve-promise"` hoặc `"reject-promise"` | Đối tượng và phương thức đã gọi promise, theo sau là dấu chấm, theo sau là `"then"` cho `"resolve-promise"` và `"catch"` cho `"reject-promise"`.                                                                                                    | `"Response.json.then"`, `"Response.json.catch"`                                                     |
| `"classic-script"` hoặc `"module-script"`   | URL nguồn của tập lệnh đã gọi.                                                                                                                                                                                                                      | `"https://example.com/scripts/myscript.js"`                                                         |

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceLongAnimationFrameTiming")}}
