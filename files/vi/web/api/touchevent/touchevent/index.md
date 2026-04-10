---
title: "TouchEvent: hàm tạo TouchEvent()"
short-title: TouchEvent()
slug: Web/API/TouchEvent/TouchEvent
page-type: web-api-constructor
browser-compat: api.TouchEvent.TouchEvent
---

{{APIRef("Touch Events")}}

Hàm tạo **`TouchEvent()`** tạo một đối tượng {{domxref("TouchEvent")}} mới.

> [!NOTE]
> Nếu bạn tạo một sự kiện tổng hợp bằng hàm tạo này, sự kiện đó sẽ không được _đáng tin cậy_, vì lý do bảo mật.
> Chỉ các đối tượng `TouchEvent` do trình duyệt tạo mới đáng tin cậy và chỉ các sự kiện đáng tin cậy mới kích hoạt các hành động mặc định.

## Cú pháp

```js-nolint
new TouchEvent(type)
new TouchEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt thành `touchstart`, `touchend`, `touchmove`, `touchcancel`
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("UIEvent/UIEvent", "UIEvent()")}}_, có thể có các thuộc tính sau:
    - `touches` {{optional_inline}}
      - : Một {{domxref("TouchList")}}, mặc định là rỗng, là danh sách các đối tượng cho mỗi điểm tiếp xúc hiện đang chạm vào bề mặt.
    - `targetTouches` {{optional_inline}}
      - : Một {{domxref("TouchList")}}, mặc định là rỗng, là danh sách các đối tượng cho mỗi điểm tiếp xúc đang chạm vào bề mặt
        _và_ bắt đầu trên phần tử là mục tiêu của sự kiện hiện tại.
    - `changedTouches` {{optional_inline}}
      - : và mặc định là `[]`, có kiểu `Touch[]`, là danh sách các đối tượng cho mỗi điểm tiếp xúc đã góp phần vào sự kiện.
    - `ctrlKey` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`, cho biết phím <kbd>ctrl</kbd> có được nhấn đồng thời hay không.
    - `shiftKey` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`, cho biết phím <kbd>shift</kbd> có được nhấn đồng thời hay không.
    - `altKey` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`, cho biết phím <kbd>alt</kbd> có được nhấn đồng thời hay không.
    - `metaKey` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`, cho biết phím <kbd>meta</kbd> có được nhấn đồng thời hay không.

### Giá trị trả về

Một đối tượng {{domxref("TouchEvent")}} mới.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TouchEvent")}}, giao diện của các đối tượng mà nó tạo ra.
