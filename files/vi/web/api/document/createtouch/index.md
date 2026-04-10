---
title: "Document: phương thức createTouch()"
short-title: createTouch()
slug: Web/API/Document/createTouch
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.Document.createTouch
---

{{APIRef("DOM")}}{{Deprecated_Header}}{{Non-standard_header}}

Phương thức **`Document.createTouch()`** tạo và trả về một đối tượng {{DOMxRef("Touch")}} mới.

> [!NOTE]
> Sử dụng phương thức khởi tạo {{domxref("TouchEvent.TouchEvent", "TouchEvent()")}}.

## Cú pháp

```js-nolint
createTouch(view, target, identifier, pageX, pageY, screenX, screenY)
```

### Tham số

> [!NOTE]
> Tất cả các tham số đều tùy chọn.

- `view`
  - : {{DOMxRef("window")}} nơi xảy ra touch.
- `target`
  - : {{DOMxRef("EventTarget")}} cho touch.
- `identifier`
  - : Giá trị cho {{DOMxRef("Touch.identifier")}}.
- `pageX`
  - : Giá trị cho {{DOMxRef("Touch.pageX")}}.
- `pageY`
  - : Giá trị cho {{DOMxRef("Touch.pageY")}}.
- `screenX`
  - : Giá trị cho {{DOMxRef("Touch.screenX")}}.
- `screenY`
  - : Giá trị cho {{DOMxRef("Touch.screenY")}}.

> [!NOTE]
> Các phiên bản trước của phương thức này bao gồm các tham số bổ sung sau nhưng những tham số đó không có trong bất kỳ tiêu chuẩn nào được liệt kê bên dưới. Do đó, các tham số này nên được xem là đã lỗi thời và không sử dụng.

- `clientX`
  - : Giá trị cho {{DOMxRef("Touch.clientX")}}.
- `clientY`
  - : Giá trị cho {{DOMxRef("Touch.clientY")}}.
- `radiusX`
  - : Giá trị cho {{DOMxRef("Touch.radiusX")}}.
- `radiusY`
  - : Giá trị cho {{DOMxRef("Touch.radiusY")}}.
- `rotationAngle`
  - : Giá trị cho {{DOMxRef("Touch.rotationAngle")}}.
- `force`
  - : Giá trị cho {{DOMxRef("Touch.force")}}.

### Giá trị trả về

Một đối tượng {{DOMxRef("Touch")}} được cấu hình như mô tả bởi các tham số đầu vào.

## Ví dụ

Ví dụ này minh họa việc sử dụng phương thức `Document.createTouch()` để tạo các đối tượng {{DOMxRef("Touch")}}.

Trong đoạn mã sau, hai đối tượng {{DOMxRef("Touch")}} được tạo cho phần tử `target`.

```js
const target = document.getElementById("target");

const touch1 = document.createTouch(window, target, 1, 15, 20, 35, 40);
const touch2 = document.createTouch(window, target, 2, 25, 30, 45, 50);
```

## Đặc tả kỹ thuật

Tính năng này không phải là một phần của bất kỳ đặc tả kỹ thuật hiện tại nào. Nó không còn nằm trong lộ trình trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Touch events](/en-US/docs/Web/API/Touch_events)
- {{DOMxRef("TouchList")}}
- {{DOMxRef("Touch")}}
- {{DOMxRef("Document.createTouchList()")}}
