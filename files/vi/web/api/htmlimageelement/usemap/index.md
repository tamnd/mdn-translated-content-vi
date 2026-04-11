---
title: "HTMLImageElement: useMap property"
short-title: useMap
slug: Web/API/HTMLImageElement/useMap
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.useMap
---

{{APIRef("HTML DOM")}}

Thuộc tính **`useMap`** của giao diện {{domxref("HTMLImageElement")}} cung cấp tên của bản đồ hình ảnh phía máy khách để áp dụng cho hình ảnh. Nó phản ánh thuộc tính nội dung [`usemap`](/en-US/docs/Web/HTML/Reference/Elements/img#usemap) của phần tử `<img>`.

## Giá trị

Một chuỗi chứa ký hiệu băm `#` theo sau là [`name`](/en-US/docs/Web/HTML/Reference/Elements/map#name) của phần tử {{HTMLElement("map")}} xác định bản đồ hình ảnh để áp dụng cho hình ảnh.

## Ví dụ

### Sử dụng useMap

Hãy xem xét `<map>` trông như thế này:

```html
<map name="mainmenu-map">
  <area
    shape="circle"
    coords="25, 25, 75"
    href="/index.html"
    alt="Return to home page" />
  <area shape="rect" coords="25, 25, 100, 150" href="/index.html" alt="Shop" />
</map>
```

Với bản đồ hình ảnh có tên `mainmenu-map`, bạn có thể tự động xây dựng các hình ảnh tham chiếu bản đồ hình ảnh như sau:

```js
const image = new Image();
image.src = "menu-box.png";
image.alt = "";
image.useMap = "#mainmenu-map";
```

Để biết thêm các ví dụ (bao gồm cả các ví dụ tương tác), hãy xem các bài viết về phần tử {{HTMLElement("map")}} và {{HTMLElement("area")}}, cũng như [hướng dẫn sử dụng bản đồ hình ảnh](/en-US/docs/Web/HTML/How_to/Add_a_hit_map_on_top_of_an_image).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Thêm bản đồ hit vào đầu hình ảnh](/en-US/docs/Web/HTML/How_to/Add_a_hit_map_on_top_of_an_image)
- {{HTMLElement("map")}}
- {{HTMLElement("area")}}
