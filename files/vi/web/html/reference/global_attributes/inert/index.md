---
title: HTML inert global attribute
short-title: inert
slug: Web/HTML/Reference/Global_attributes/inert
page-type: html-attribute
browser-compat: html.global_attributes.inert
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`inert`** là thuộc tính Boolean cho biết phần tử và tất cả các con cháu trong cây phẳng của nó trở thành _bất hoạt_. Thuộc tính `inert` có thể được thêm vào các phần nội dung không nên tương tác được. Khi một phần tử bất hoạt, cùng với tất cả các con cháu của phần tử đó, bao gồm cả các phần tử thường có tương tác như liên kết, nút bấm và điều khiển biểu mẫu, đều bị vô hiệu hóa vì chúng không thể nhận focus hoặc được nhấp vào. Thuộc tính `inert` cũng có thể được thêm vào các phần tử ngoài màn hình hoặc bị ẩn. Một phần tử bất hoạt, cùng với các con cháu của nó, bị loại khỏi thứ tự tab và cây trợ năng.

Các hộp thoại {{htmlelement("dialog")}} được tạo bằng [`showModal()`](/en-US/docs/Web/API/HTMLDialogElement/showModal) thoát khỏi trạng thái bất hoạt, nghĩa là chúng không kế thừa trạng thái bất hoạt từ tổ tiên, nhưng có thể được làm bất hoạt bằng cách đặt thuộc tính `inert` trực tiếp lên chúng. Không có phần tử nào khác có thể thoát khỏi trạng thái bất hoạt.

> [!NOTE]
> Mặc dù `inert` là thuộc tính toàn cục và có thể áp dụng cho bất kỳ phần tử nào, nó thường được sử dụng cho các phần nội dung. Để làm cho từng điều khiển riêng lẻ "bất hoạt", hãy xem xét sử dụng thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled), cùng với các kiểu CSS {{cssxref(":disabled")}}, thay vào đó.

Các phần tử HTML bất hoạt và các con cháu trong cây phẳng của chúng:

- Không có sự kiện {{domxref("Element/click_event", "click")}} kích hoạt khi được nhấp vào.
- Không thể nhận focus và sự kiện {{domxref("Element/focus_event", "focus")}} không thể kích hoạt trên chúng.
- Không thể tìm kiếm thông qua tính năng tìm trong trang của trình duyệt (không có nội dung nào của chúng được tìm thấy/khớp).
- Không cho phép người dùng chọn văn bản trong nội dung của chúng — tương tự như sử dụng thuộc tính CSS {{cssxref("user-select")}} để vô hiệu hóa việc chọn văn bản.
- Không thể chỉnh sửa nội dung có thể chỉnh sửa. Điều này bao gồm, ví dụ, nội dung của các trường {{htmlelement("input")}} văn bản và các phần tử văn bản có [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt trên chúng.
- Bị ẩn khỏi các công nghệ hỗ trợ vì chúng bị loại trừ khỏi cây trợ năng.

Các tính năng khác sau đây có thể được sử dụng để đặt một phần tử và các con cháu của nó vào trạng thái bất hoạt:

- Thuộc tính CSS {{cssxref("interactivity")}}.
- Thuộc tính DOM {{domxref("HTMLElement.inert")}}.

## Vấn đề trợ năng

Hãy cẩn thận khi áp dụng thuộc tính `inert` để đảm bảo trợ năng. Theo mặc định, không có cách trực quan nào để biết liệu một phần tử hay cây con của nó có đang bất hoạt hay không. Là một nhà phát triển web, bạn có trách nhiệm chỉ rõ các phần nội dung đang hoạt động và những phần đang bất hoạt.

Trong khi cung cấp các gợi ý trực quan và phi trực quan về trạng thái bất hoạt của nội dung, hãy nhớ rằng khung nhìn có thể chỉ chứa các phần nội dung. Người dùng có thể thu phóng đến một phần nhỏ của nội dung, hoặc người dùng có thể không xem được nội dung đó. Các phần bất hoạt mà không rõ ràng là bất hoạt có thể dẫn đến sự thất vọng và trải nghiệm người dùng kém.

## Ví dụ

Trong ví dụ này, phần tử {{htmlelement("div")}} thứ hai và tất cả các con cháu của nó được làm bất hoạt thông qua thuộc tính `inert`:

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

{{ EmbedLiveSample('Examples', 560, 200) }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("dialog")}}
- Thuộc tính DOM {{domxref("HTMLElement.inert")}}
- Thuộc tính CSS {{cssxref("interactivity")}}
