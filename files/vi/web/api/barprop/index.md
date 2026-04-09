---
title: BarProp
slug: Web/API/BarProp
page-type: web-api-interface
browser-compat: api.BarProp
---

{{APIRef("DOM")}}

Giao diện **`BarProp`** của [Mô hình đối tượng tài liệu (Document Object Model)](/en-US/docs/Web/API/Document_Object_Model) biểu diễn các phần tử giao diện người dùng của trình duyệt web được phơi bày cho script trong các trang web. Mỗi phần tử giao diện sau đây được biểu diễn bởi một đối tượng `BarProp`.

- {{domxref("Window.locationbar")}}
  - : Thanh địa chỉ của trình duyệt.
- {{domxref("Window.menubar")}}
  - : Thanh menu của trình duyệt.
- {{domxref("Window.personalbar")}}
  - : Thanh cá nhân của trình duyệt.
- {{domxref("Window.scrollbars")}}
  - : Các thanh cuộn của trình duyệt.
- {{domxref("Window.statusbar")}}
  - : Thanh trạng thái của trình duyệt.
- {{domxref("Window.toolbar")}}
  - : Thanh công cụ của trình duyệt.

Không truy cập trực tiếp vào giao diện `BarProp`, mà thông qua một trong các phần tử này.

## Thuộc tính thể hiện

- {{domxref("BarProp.visible")}} {{ReadOnlyInline}}
  - : Một {{jsxref("Boolean")}}, có giá trị `true` nếu thanh được biểu diễn bởi phần tử giao diện đang dùng là hiển thị.

## Ví dụ

Ví dụ sau in ra console một đối tượng `BarProp` biểu diễn thanh địa chỉ.

```js
console.log(window.locationbar);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
