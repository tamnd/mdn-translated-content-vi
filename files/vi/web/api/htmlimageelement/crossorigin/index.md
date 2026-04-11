---
title: "HTMLImageElement: crossOrigin property"
short-title: crossOrigin
slug: Web/API/HTMLImageElement/crossOrigin
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.crossOrigin
---

{{APIRef("HTML DOM")}}

Thuộc tính **`crossOrigin`** của giao diện {{domxref("HTMLImageElement")}} là một chuỗi chỉ định cài đặt Chia sẻ tài nguyên nguồn gốc chéo ({{Glossary("CORS")}}) để sử dụng khi truy xuất hình ảnh. Nó phản ánh thuộc tính nội dung [`crossorigin`](/en-US/docs/Web/HTML/Reference/Elements/img#crossorigin) của phần tử `<img>`.

## Giá trị

Một chuỗi có giá trị là một trong `anonymous` hoặc `use-credentials`. Để biết ý nghĩa của chúng, hãy xem tham chiếu thuộc tính HTML [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin).

## Ví dụ

### Đặt thuộc tính crossorigin

Trong ví dụ này, phần tử {{HTMLElement("img")}} mới được tạo và thêm vào tài liệu, tải hình ảnh ở trạng thái Ẩn danh; hình ảnh sẽ được tải bằng CORS và thông tin xác thực sẽ được sử dụng cho tất cả các lần tải trên nhiều nguồn gốc.

#### JavaScript

Mã bên dưới minh họa việc đặt thuộc tính `crossOrigin` trên phần tử `<img>` để định cấu hình quyền truy cập CORS nhằm tìm nạp hình ảnh mới được tạo.

```js
const container = document.querySelector(".container");

function loadImage(url) {
  const image = new Image(200, 200);
  image.addEventListener("load", () => container.prepend(image));

  image.addEventListener("error", () => {
    const errMsg = document.createElement("output");
    errMsg.value = `Error loading image at ${url}`;
    container.append(errMsg);
  });

  image.crossOrigin = "anonymous";
  image.alt = "";
  image.src = url;
}

loadImage("/shared-assets/images/examples/balloon.jpg");
```

### HTML

```html
<div class="container">
  <p>
    Here's a paragraph. It's a very interesting paragraph. You are captivated by
    this paragraph. Keep reading this paragraph. Okay, now you can stop reading
    this paragraph. Thanks for reading me.
  </p>
</div>
```

### CSS

```css
body {
  font:
    1.125rem/1.5 "Helvetica",
    "Arial",
    sans-serif;
}

.container {
  display: flow-root;
  width: 37.5em;
  border: 1px solid #d2d2d2;
}

img {
  float: left;
  padding-right: 1.5em;
}

output {
  background: rgb(100 100 100 / 100%);
  font-family: "Courier New", monospace;
  width: 95%;
}
```

### Kết quả

{{EmbedLiveSample("Setting the crossorigin attribute", 600, 260)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLLinkElement.crossOrigin")}}
- {{domxref("HTMLMediaElement.crossOrigin")}}
- {{domxref("HTMLScriptElement.crossOrigin")}}
