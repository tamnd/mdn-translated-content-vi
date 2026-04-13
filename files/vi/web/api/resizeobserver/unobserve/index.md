---
title: "ResizeObserver: phương thức unobserve()"
short-title: unobserve()
slug: Web/API/ResizeObserver/unobserve
page-type: web-api-instance-method
browser-compat: api.ResizeObserver.unobserve
---

{{APIRef("Resize Observer API")}}

Phương thức **`unobserve()`** của giao diện {{domxref("ResizeObserver")}} kết thúc việc theo dõi một {{domxref('Element')}} hoặc {{domxref('SVGElement')}} được chỉ định.

## Cú pháp

```js-nolint
unobserve(target)
```

### Tham số

- `target`
  - : Tham chiếu đến một {{domxref('Element')}} hoặc {{domxref('SVGElement')}} sẽ ngừng được theo dõi.

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

checkbox.addEventListener("change", () => {
  if (checkbox.checked) {
    resizeObserver.observe(divElem);
  } else {
    resizeObserver.unobserve(divElem);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
