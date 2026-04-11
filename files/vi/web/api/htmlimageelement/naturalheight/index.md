---
title: "HTMLImageElement: naturalHeight property"
short-title: naturalHeight
slug: Web/API/HTMLImageElement/naturalHeight
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.naturalHeight
---

{{APIRef("HTML DOM")}}

Thuộc tính **`naturalHeight`** chỉ đọc của giao diện {{domxref("HTMLImageElement")}} trả về chiều cao nội tại (tự nhiên), được điều chỉnh theo mật độ của hình ảnh trong {{Glossary("CSS pixel", "CSS pixels")}}.

Đây là chiều cao của hình ảnh nếu được vẽ mà không có gì hạn chế chiều cao của nó; nếu bạn không chỉ định chiều cao cho hình ảnh cũng như không đặt hình ảnh bên trong vùng chứa giới hạn hoặc chỉ định rõ ràng chiều cao của hình ảnh thì hình ảnh sẽ được hiển thị ở độ cao này.

> [!NOTE]
> Hầu hết chiều cao tự nhiên là chiều cao thực tế của hình ảnh được máy chủ gửi. Tuy nhiên, trình duyệt có thể sửa đổi hình ảnh trước khi đẩy nó vào trình kết xuất. Ví dụ: Chrome [làm giảm độ phân giải của hình ảnh trên các thiết bị cấp thấp](https://crbug.com/1187043#c7). Trong những trường hợp như vậy, `naturalHeight` sẽ coi chiều cao của hình ảnh được sửa đổi bởi sự can thiệp của trình duyệt như chiều cao tự nhiên và trả về giá trị này.

## Giá trị

Một giá trị số nguyên biểu thị chiều cao nội tại của hình ảnh, tính bằng pixel CSS. Đây là độ cao mà hình ảnh được vẽ một cách tự nhiên khi không có ràng buộc hoặc giá trị cụ thể nào được thiết lập cho hình ảnh. Chiều cao tự nhiên này được điều chỉnh theo mật độ điểm ảnh của thiết bị mà nó được hiển thị, không giống như {{domxref("HTMLImageElement.height", "height")}}.

Nếu chiều cao nội tại không có sẵn—do hình ảnh không chỉ định chiều cao nội tại hoặc do dữ liệu hình ảnh không có sẵn để lấy thông tin này, `naturalHeight` trả về 0.

## Ví dụ

Ví dụ này hiển thị cả kích thước tự nhiên, được điều chỉnh theo mật độ của hình ảnh cũng như kích thước được hiển thị của nó khi được thay đổi bởi CSS của trang và các yếu tố khác.

### HTML

```html
<div class="box">
  <img
    src="/en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-400px.png"
    class="image"
    alt="A round wall clock with a white dial and black numbers" />
</div>
<pre></pre>
```

HTML có hình ảnh 400x398 pixel được đặt bên trong {{HTMLElement("div")}}.

### CSS

```css
.box {
  width: 200px;
  height: 200px;
}

.image {
  width: 100%;
}
```

Điều chính cần lưu ý trong CSS ở trên là kiểu được sử dụng cho vùng chứa hình ảnh sẽ được vẽ có chiều rộng 200px và hình ảnh sẽ được vẽ để lấp đầy chiều rộng của nó (100%).

### JavaScript

```js
const output = document.querySelector("pre");
const image = document.querySelector("img");

image.addEventListener("load", (event) => {
  const { naturalWidth, naturalHeight, width, height } = image;
  output.textContent = `
Natural size: ${naturalWidth} x ${naturalHeight} pixels
Displayed size: ${width} x ${height} pixels
`;
});
```

Mã JavaScript chuyển các kích thước tự nhiên và kích thước được hiển thị vào {{HTMLElement("pre")}}. Điều này được thực hiện để phản hồi trình xử lý sự kiện {{domxref("HTMLElement.load_event", "load")}} của hình ảnh, nhằm đảm bảo rằng hình ảnh có sẵn trước khi thử kiểm tra chiều rộng và chiều cao của nó.

### Kết quả

{{EmbedLiveSample("Examples", 600, 280)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.height")}}
- {{domxref("HTMLImageElement.naturalWidth")}}
