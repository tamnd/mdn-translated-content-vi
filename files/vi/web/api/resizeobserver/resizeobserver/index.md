---
title: "ResizeObserver: hàm tạo ResizeObserver()"
short-title: ResizeObserver()
slug: Web/API/ResizeObserver/ResizeObserver
page-type: web-api-constructor
browser-compat: api.ResizeObserver.ResizeObserver
---

{{APIRef("Resize Observer API")}}

Hàm tạo **`ResizeObserver`** tạo ra một đối tượng {{domxref("ResizeObserver")}} mới, có thể dùng để báo cáo các thay đổi của content box hoặc border box của một {{domxref('Element')}} hoặc bounding box của một {{domxref('SVGElement')}}.

## Cú pháp

```js-nolint
new ResizeObserver(callback)
```

### Tham số

- `callback`
  - : Hàm được gọi mỗi khi một thay đổi kích thước đang được quan sát xảy ra. Hàm này được gọi với hai tham số:
    - `entries`
      - : Một mảng các đối tượng {{domxref('ResizeObserverEntry')}} có thể dùng để truy cập kích thước mới của phần tử sau mỗi thay đổi.
    - `observer`
      - : Tham chiếu đến chính `ResizeObserver`, để nó chắc chắn có thể truy cập được từ bên trong callback nếu bạn cần. Ví dụ, điều này có thể dùng để tự động ngừng theo dõi observer khi đạt đến một điều kiện nhất định, nhưng bạn có thể bỏ qua nếu không cần.

    Callback thường sẽ theo một mẫu như sau:

    ```js
    function callback(entries, observer) {
      for (const entry of entries) {
        // Thực hiện một việc nào đó với từng entry
        // và có thể làm thêm điều gì đó với chính observer
      }
    }
    ```

## Ví dụ

Đoạn mã sau được lấy từ ví dụ [resize-observer-text.html](https://mdn.github.io/dom-examples/resize-observer/resize-observer-text.html)
([xem mã nguồn](https://github.com/mdn/dom-examples/blob/main/resize-observer/resize-observer-text.html)):

```js
const resizeObserver = new ResizeObserver((entries) => {
  for (const entry of entries) {
    if (entry.contentBoxSize) {
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
        // đường dẫn cũ
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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
