---
title: "HTMLLinkElement: thuộc tính imageSizes"
short-title: imageSizes
slug: Web/API/HTMLLinkElement/imageSizes
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.imageSizes
---

{{APIRef("HTML DOM")}}

Thuộc tính **`imageSizes`** của giao diện {{domxref("HTMLLinkElement")}} cho biết kích thước và điều kiện cho các hình ảnh được preload xác định bởi thuộc tính {{domxref("HTMLLinkElement.imageSrcset", "imageSrcset")}}. Nó phản ánh giá trị của thuộc tính [`imagesizes`](/en-US/docs/Web/HTML/Reference/Elements/link#imagesizes) của phần tử {{htmlelement("link")}}. Thuộc tính này có thể lấy hoặc đặt giá trị thuộc tính `imagesizes`.

Thuộc tính `imagesizes` của phần tử `<link>` giống như thuộc tính `sizes` của phần tử {{htmlelement("img")}}: danh sách **kích thước nguồn** được phân tách bằng dấu phẩy. Mỗi kích thước nguồn bao gồm một [điều kiện phương tiện](/en-US/docs/Web/CSS/Guides/Media_queries), kích thước của hình ảnh dưới dạng {{cssxref("length")}}, hoặc từ khóa `auto`, phải đứng đầu. Để biết thêm thông tin về cú pháp của thuộc tính `sizes`, xem [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes).

Các thuộc tính `imagesrcset` và `imagesizes` chỉ liên quan đến các phần tử `<link>` có cả thuộc tính `rel` được đặt thành `preload` và thuộc tính `as` được đặt thành `image`.

## Giá trị

Một chuỗi gồm các kích thước nguồn được phân tách bằng dấu phẩy, hoặc chuỗi rỗng `""` nếu không được chỉ định.

## Ví dụ

Cho phần tử `<link>` sau:

```html
<link
  rel="preload"
  as="image"
  imagesrcset="narrow.png, medium.png 600w, wide.png 1200w"
  imagesizes="(width < 400px) 200px, (400px <= width < 600px) 75vw, 50vw" />
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  padding: 0 0.25rem;
  font-size: 1.2em;
  line-height: 1.4;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

...chúng ta có thể lấy và cập nhật giá trị thuộc tính `imagesizes` bằng thuộc tính `imageSizes`:

```js
const link = document.querySelector("link");
log(`Original: ${link.imageSizes}`);

// Thay đổi giá trị
link.imageSizes = "50vw";
log(`Updated: ${link.imageSizes}`);
```

{{EmbedLiveSample('Examples',"","80")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("HTMLLinkElement.imageSrcset")}}
- {{domxref("HTMLImageElement.sizes")}}
- [Media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
- [Sử dụng thuộc tính `srcset` và `sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#using_the_srcset_and_sizes_attributes)
