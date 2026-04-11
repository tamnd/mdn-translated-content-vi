---
title: "HTMLElement: thuộc tính inert"
short-title: inert
slug: Web/API/HTMLElement/inert
page-type: web-api-instance-property
browser-compat: api.HTMLElement.inert
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`inert`** của {{domxref("HTMLElement")}} phản ánh giá trị của thuộc tính [`inert`](/en-US/docs/Web/HTML/Reference/Global_attributes/inert) của phần tử. Đây là giá trị boolean mà khi có mặt, khiến trình duyệt "bỏ qua" các sự kiện nhập của người dùng cho phần tử, bao gồm các sự kiện tiêu điểm và sự kiện từ công nghệ hỗ trợ. Trình duyệt cũng có thể bỏ qua tìm kiếm trong trang và chọn văn bản trong phần tử. Điều này có thể hữu ích khi xây dựng giao diện người dùng như các modal nơi bạn muốn "bẫy" tiêu điểm bên trong modal khi nó hiển thị.

Lưu ý rằng nếu thuộc tính `inert` không được chỉ định, bản thân phần tử có thể vẫn kế thừa tính trơ từ phần tử cha. Tuy nhiên, tính trơ được kế thừa đó không được phản ánh bởi giá trị của thuộc tính này. Đặt thuộc tính một cách rõ ràng thành `false` không thể hoàn tác tính trơ được kế thừa từ phần tử cha.

## Giá trị

Một giá trị Boolean, là `true` nếu phần tử là trơ; ngược lại, giá trị là `false`.

## Ví dụ

### HTML

```html
<div>
  <label for="button1">Button 1</label>
  <button id="button1">I am not inert</button>
</div>
<div inert>
  <label for="button2">Button 2</label>
  <button id="button2">I am inert</button>
</div>
```

### CSS

```css
[inert] > * {
  opacity: 0.5;
}
```

{{ EmbedLiveSample('Examples', 560, 200) }}

> [!NOTE]
> Thuộc tính này, bản thân nó, sẽ không gây ra bất kỳ thay đổi trực quan nào đối với nội dung được hiển thị trong trình duyệt. Trong ví dụ trên, CSS đã được áp dụng để mọi phần tử con trực tiếp của phần tử có thuộc tính inert được hiển thị bán trong suốt.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính toàn cục: `inert`](/en-US/docs/Web/HTML/Reference/Global_attributes/inert)
- {{domxref("HTMLInputElement.disabled", "disabled")}}
- {{HTMLElement("dialog")}}
- Thuộc tính CSS {{cssxref("interactivity")}}
