---
title: "HTMLLinkElement: thuộc tính imageSrcset"
short-title: imageSrcset
slug: Web/API/HTMLLinkElement/imageSrcset
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.imageSrcset
---

{{APIRef("HTML DOM")}}

Thuộc tính **`imageSrcset`** của giao diện {{domxref("HTMLLinkElement")}} là một chuỗi xác định một hoặc nhiều **chuỗi ứng viên hình ảnh** được phân tách bằng dấu phẩy. Thuộc tính này phản ánh giá trị của thuộc tính [`imagesrcset`](/en-US/docs/Web/HTML/Reference/Elements/link#imagesrcset) của phần tử {{htmlelement("link")}}. Thuộc tính này có thể lấy hoặc đặt giá trị thuộc tính `imagesrcset`.

Mỗi chuỗi ứng viên hình ảnh chứa URL hình ảnh và một bộ mô tả chiều rộng và/hoặc mật độ pixel tùy chọn cho biết điều kiện sử dụng hình ảnh ứng viên đó.

```plain
"images/team-photo.jpg, images/team-photo-retina.jpg 2x, images/team-photo-large.jpg 1400w"
```

Đối với các phần tử HTML {{htmlelement("link")}} có [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) và [`as="image"`](/en-US/docs/Web/HTML/Reference/Elements/link#as), thuộc tính `imagesrcset` có cú pháp và ngữ nghĩa tương tự như thuộc tính [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset) của phần tử {{htmlelement("img")}}, cho biết nên preload tài nguyên phù hợp được sử dụng bởi phần tử `<img>` với các giá trị tương ứng cho thuộc tính `srcset` và `sizes` của nó.

Nếu thuộc tính `imageSrcset` bao gồm bộ mô tả chiều rộng, thuộc tính {{domxref("HTMLLinkElement.imageSizes", "imageSizes")}} phải khác null, nếu không giá trị `imageSrcset` sẽ bị bỏ qua.

## Giá trị

Một chuỗi gồm danh sách được phân tách bằng dấu phẩy của một hoặc nhiều chuỗi ứng viên hình ảnh, hoặc chuỗi rỗng `""` nếu không được chỉ định.

## Ví dụ

Cho phần tử `<link>` sau:

```html
<link
  rel="preload"
  as="image"
  imagesizes="50vw"
  imagesrcset="bg-narrow.png, bg-wide.png 800w" />
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

...chúng ta có thể truy cập giá trị thuộc tính `imagesrcset` và cập nhật nó bằng thuộc tính `imageSrcset`:

```js
const link = document.querySelector("link");
log(`Original: ${link.imageSrcset}`);

// thêm một chuỗi ứng viên hình ảnh
link.imageSrcset += ", bg-huge.png 1200w";
log(`Updated: ${link.imageSrcset}`);
```

{{EmbedLiveSample('Examples',"","80")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("HTMLLinkElement.imageSizes")}}
- {{domxref("HTMLImageElement.srcset")}}
- [Tải speculative](/en-US/docs/Web/Performance/Guides/Speculative_loading#link_relpreload)
- [Responsive images](/en-US/docs/Web/HTML/Guides/Responsive_images)
