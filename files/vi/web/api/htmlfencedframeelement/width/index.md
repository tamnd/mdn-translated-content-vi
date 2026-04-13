---
title: "HTMLFencedFrameElement: width property"
short-title: width
slug: Web/API/HTMLFencedFrameElement/width
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLFencedFrameElement.width
---

{{SeeCompatTable}}{{APIRef("Fenced Frame API")}}

Thuộc tính **`width`** của {{domxref("HTMLFencedFrameElement")}} lấy và đặt giá trị của thuộc tính `width` của {{htmlelement("fencedframe")}} tương ứng, chỉ định chiều rộng của phần tử.

Kích thước của nội dung nhúng có thể được đặt bởi các thuộc tính `contentWidth` và `contentHeight` nội bộ của đối tượng {{domxref("HTMLFencedFrameElement.config", "config")}} của `<fencedframe>`. Trong những trường hợp đó, việc thay đổi `width` hoặc {{domxref("HTMLFencedFrameElement.height", "height")}} của `<fencedframe>` sẽ thay đổi kích thước của vùng chứa nhúng trên trang, nhưng tài liệu bên trong vùng chứa sẽ được thu phóng trực quan cho vừa khít. Chiều rộng và chiều cao được báo cáo của tài liệu nhúng (tức là {{domxref("Window.innerWidth")}} và {{domxref("Window.innerHeight")}}) sẽ không thay đổi.

## Giá trị

Một chuỗi đại diện cho chiều rộng của phần tử tính bằng pixel CSS. Giá trị mặc định là `300`.

## Ví dụ

```js
const frame = document.createElement("fencedframe");
frame.width = "480";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fenced frames](https://privacysandbox.google.com/private-advertising/fenced-frame) trên privacysandbox.google.com
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
