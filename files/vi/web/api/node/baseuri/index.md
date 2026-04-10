---
title: "Node: thuộc tính baseURI"
short-title: baseURI
slug: Web/API/Node/baseURI
page-type: web-api-instance-property
browser-compat: api.Node.baseURI
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`baseURI`** của giao diện {{domxref("Node")}} trả về URL cơ sở tuyệt đối của tài liệu chứa nút.

URL cơ sở được dùng để phân giải các URL tương đối khi trình duyệt cần lấy một URL tuyệt đối, chẳng hạn khi xử lý thuộc tính `src` của phần tử HTML {{HTMLElement("img")}} hoặc các thuộc tính `xlink:href` {{deprecated_inline}} hay `href` trong SVG.

Mặc dù thuộc tính này chỉ đọc, giá trị của nó được xác định bởi một thuật toán mỗi khi thuộc tính được truy cập, và có thể thay đổi nếu các điều kiện đã thay đổi.

URL cơ sở được xác định như sau:

1. Theo mặc định, URL cơ sở là vị trí của tài liệu (như được xác định bởi {{domxref("window.location")}}).
2. Nếu đó là một tài liệu HTML và có phần tử {{HTMLElement("base")}} trong tài liệu, thì giá trị `href` của phần tử `base` _đầu tiên_ có thuộc tính đó sẽ được dùng thay thế.

## Giá trị

Một chuỗi biểu thị URL cơ sở của {{domxref("Node")}}.

## Ví dụ

### Không có `<base>`

```html
<output>Chưa được tính</output>
```

```js
const output = document.querySelector("output");
output.value = output.baseURI;
```

{{EmbedLiveSample("Without_base", "100%", 40)}}

### Có `<base>`

```html
<base href="https://developer.mozilla.org/modified_base_uri/" />
<output>Chưa được tính</output>
```

```js
const output = document.querySelector("output");
output.value = output.baseURI;
```

{{EmbedLiveSample("With_base", "100%", 40)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("base")}}.
