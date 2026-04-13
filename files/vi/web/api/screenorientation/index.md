---
title: ScreenOrientation
slug: Web/API/ScreenOrientation
page-type: web-api-interface
browser-compat: api.ScreenOrientation
---

{{APIRef("Screen Orientation API")}}

Giao diện **`ScreenOrientation`** của [Screen Orientation API](/en-US/docs/Web/API/Screen_Orientation_API) cung cấp thông tin về hướng hiện tại của tài liệu.

Một đối tượng phiên bản **`ScreenOrientation`** có thể được lấy bằng thuộc tính {{domxref("screen.orientation")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{DOMxRef("ScreenOrientation.type")}} {{ReadOnlyInline}}
  - : Trả về loại hướng hiện tại của tài liệu, một trong các giá trị `portrait-primary`, `portrait-secondary`, `landscape-primary`, hoặc `landscape-secondary`.
- {{DOMxRef("ScreenOrientation.angle")}} {{ReadOnlyInline}}
  - : Trả về góc hướng hiện tại của tài liệu.

## Phương thức phiên bản

- {{DOMxRef("ScreenOrientation.lock()")}}
  - : Khóa hướng của tài liệu chứa về hướng mặc định của nó và trả về một {{JSxRef("Promise")}}.
- {{DOMxRef("ScreenOrientation.unlock()")}}
  - : Mở khóa hướng của tài liệu chứa khỏi hướng mặc định của nó.

## Sự kiện

Lắng nghe các sự kiện này bằng `addEventListener()` hoặc bằng cách gán trình lắng nghe sự kiện vào thuộc tính `oneventname` của giao diện này.

- {{DOMxRef("ScreenOrientation.change_event", "change")}}
  - : Được kích hoạt mỗi khi màn hình thay đổi hướng.

## Ví dụ

Trong ví dụ sau, chúng ta lắng nghe sự kiện {{DOMxRef("ScreenOrientation.change_event", "change")}} của hướng và ghi lại {{DOMxRef("ScreenOrientation.type", "screen orientation type", "", "nocode")}} và {{DOMxRef("ScreenOrientation.angle", "angle", "", "nocode")}} mới.

```js
screen.orientation.addEventListener("change", (event) => {
  const type = event.target.type;
  const angle = event.target.angle;
  console.log(`ScreenOrientation change: ${type}, ${angle} degrees.`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
