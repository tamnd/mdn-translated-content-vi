---
title: "Attr: thuộc tính namespaceURI"
short-title: namespaceURI
slug: Web/API/Attr/namespaceURI
page-type: web-api-instance-property
browser-compat: api.Attr.namespaceURI
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`namespaceURI`** của giao diện {{domxref("Attr")}} trả về URI không gian tên của thuộc tính,
hoặc `null` nếu phần tử không nằm trong một không gian tên.

URI của không gian tên được thiết lập khi {{domxref("Attr")}} được tạo và không thể thay đổi.
Một thuộc tính có không gian tên có thể được tạo bằng {{domxref("Element.setAttributeNS()")}}.

> [!NOTE]
> Một thuộc tính không kế thừa không gian tên từ phần tử mà nó được gắn vào.
> Nếu một thuộc tính không được gán rõ ràng không gian tên, thì nó không có không gian tên.

Trình duyệt không tự xử lý hoặc áp đặt việc kiểm tra hợp lệ không gian tên. Việc thực hiện bất kỳ kiểm tra cần thiết nào là tùy thuộc vào ứng dụng JavaScript.
Lưu ý thêm rằng tiền tố không gian tên, một khi đã được liên kết với một nút thuộc tính cụ thể, không thể thay đổi.

## Giá trị

Một chuỗi chứa URI của không gian tên, hoặc `null` nếu thuộc tính không nằm trong một không gian tên.

## Ví dụ

Ví dụ sau cho thấy kết quả đối với một thuộc tính có tiền tố trong trường hợp một phần tử HTML và một phần tử SVG.
Vì HTML không xử lý không gian tên, nó sẽ luôn trả về `null` trong trường hợp đó.
Với phần tử SVG, nó sẽ trả về URI của không gian tên XML, `http://www.w3.org/XML/1998/namespace`.

### HTML

```html
<svg xml:lang="en-US" class="struct" height="1" width="1">Click me</svg>
<label xml:lang="en-US" class="struct"></label>

<p>
  <button>Show value for &lt;svg&gt;</button>
  <button>Show value for &lt;label&gt;</button>
</p>

<p>
  Namespace URI of the attribute <code>xml:lang</code>:
  <output id="result">None.</output>
</p>
```

### JavaScript

```js
const elements = document.querySelectorAll(".struct");
const buttons = document.querySelectorAll("button");
const outputEl = document.querySelector("#result");

let i = 0;
for (const button of buttons) {
  const element = elements[i];
  button.addEventListener("click", () => {
    const attribute = element.attributes[0];
    outputEl.value = attribute.namespaceURI;
  });
  i++;
}
```

{{ EmbedLiveSample('Example','100%',100) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính {{domxref("Attr.name")}}, trả về tên đủ điều kiện của thuộc tính, {{domxref("Attr.localName")}}, phần cục bộ của tên, và {{domxref("Attr.prefix")}}, tiền tố không gian tên.
- Thuộc tính {{domxref("Element.namespaceURI")}}, tương đương với thuộc tính này nhưng dành cho {{domxref("Element")}}.
- Phương thức {{domxref("Element.setAttributeNS()")}}, tạo một thuộc tính với không gian tên cho trước.
