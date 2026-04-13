---
title: "ResizeObserver: phương thức observe()"
short-title: observe()
slug: Web/API/ResizeObserver/observe
page-type: web-api-instance-method
browser-compat: api.ResizeObserver.observe
---

{{APIRef("Resize Observer API")}}

Phương thức **`observe()`** của giao diện {{domxref("ResizeObserver")}} bắt đầu theo dõi {{domxref('Element')}} hoặc {{domxref('SVGElement')}} được chỉ định.

## Cú pháp

```js-nolint
observe(target)
observe(target, options)
```

### Tham số

- `target`
  - : Tham chiếu đến một {{domxref('Element')}} hoặc {{domxref('SVGElement')}} sẽ được theo dõi.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn cho phép bạn thiết lập các tùy chọn cho việc quan sát. Hiện tại nó chỉ có một tùy chọn duy nhất có thể đặt:
    - `box`
      - : Thiết lập hộp mô hình nào mà observer sẽ theo dõi các thay đổi. Các giá trị có thể là:
        - `content-box` (mặc định)
          - : Kích thước của vùng nội dung như được định nghĩa trong CSS.
        - `border-box`
          - : Kích thước của vùng viền của hộp như được định nghĩa trong CSS.
        - `device-pixel-content-box`
          - : Kích thước của vùng nội dung như được định nghĩa trong CSS, tính bằng {{glossary("device pixel", "điểm ảnh thiết bị")}}, trước khi áp dụng bất kỳ phép biến đổi CSS nào lên phần tử hoặc các phần tử cha của nó.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Không có.

## Ví dụ

Đoạn mã sau được lấy từ ví dụ [resize-observer-text.html](https://mdn.github.io/dom-examples/resize-observer/resize-observer-text.html)
([xem mã nguồn](https://github.com/mdn/dom-examples/blob/main/resize-observer/resize-observer-text.html)):

```js
const resizeObserver = new ResizeObserver((entries) => {
  for (const entry of entries) {
    if (entry.contentBoxSize) {
      // Kiểm tra chrome vì đang dùng một mảng không chuẩn
      if (entry.contentBoxSize[0]) {
        h1Elem.style.fontSize = `${Math.max(
          1.5,
          entry.contentBoxSize[0].inlineSize / 200,
        )}rem`;
        pElem.style.fontSize = `${Math.max(
          1,
          entry.contentBoxSize[0].inlineSize / 600,
        )}rem`;
      } else {
        h1Elem.style.fontSize = `${Math.max(
          1.5,
          entry.contentBoxSize.inlineSize / 200,
        )}rem`;
        pElem.style.fontSize = `${Math.max(
          1,
          entry.contentBoxSize.inlineSize / 600,
        )}rem`;
      }
    } else {
      h1Elem.style.fontSize = `${Math.max(
        1.5,
        entry.contentRect.width / 200,
      )}rem`;
      pElem.style.fontSize = `${Math.max(1, entry.contentRect.width / 600)}rem`;
    }
  }
  console.log("Kích thước đã thay đổi");
});

resizeObserver.observe(divElem);
```

Lời gọi `observe()` với một đối tượng tùy chọn sẽ trông như sau:

```js
resizeObserver.observe(divElem, { box: "border-box" });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
