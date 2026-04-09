---
title: "ARIA: vai trò textbox"
short-title: textbox
slug: Web/Accessibility/ARIA/Reference/Roles/textbox_role
page-type: aria-role
sidebar: accessibilitysidebar
---

Vai trò `textbox` được dùng để xác định một phần tử cho phép nhập văn bản tự do. Khi có thể, thay vì dùng vai trò này, hãy dùng phần tử {{HTMLElement("input")}} với [type="text"](/en-US/docs/Web/HTML/Reference/Elements/input/text) cho nhập một dòng, hoặc phần tử {{HTMLElement("textarea")}} cho nhập nhiều dòng.

## Mô tả

Khi một phần tử có vai trò `textbox`, trình duyệt sẽ gửi một sự kiện textbox có thể truy cập tới công nghệ hỗ trợ, và công nghệ đó có thể thông báo cho người dùng về nó.

Mặc định là đầu vào một dòng, trong đó <kbd>Return</kbd> hoặc <kbd>Enter</kbd> sẽ gửi biểu mẫu; trong trường hợp này, nên dùng HTML {{HTMLElement("input")}} với `type="text"`. Để tạo một hộp văn bản nhiều dòng hỗ trợ xuống dòng, giống như HTML {{HTMLElement("textarea")}}, hãy đặt `aria-multiline="true"`. Bao gồm thuộc tính HTML `contenteditable` để đảm bảo nút văn bản có thể chỉnh sửa.

```html
<!-- Text input field -->
<div id="txtboxLabel">Enter your five-digit zip code</div>
<div
  role="textbox"
  contenteditable="true"
  aria-placeholder="5-digit zip code"
  aria-labelledby="txtboxLabel"></div>

<!-- Multi-line text area -->
<div id="txtboxMultilineLabel">Enter the tags for the article</div>
<div
  role="textbox"
  contenteditable="true"
  aria-multiline="true"
  aria-labelledby="txtboxMultilineLabel"
  aria-required="true"></div>
```

Các phần tử ngữ nghĩa ngắn gọn hơn và không cần JavaScript để hỗ trợ các tính năng textbox.

```html
<label for="txtbox">Enter your five-digit zip code</label>
<input type="text" placeholder="5-digit zip code" id="txtbox" />

<!-- Multi-line text area -->
<label for="txtboxMultiline">Enter the tags for the article</label>
<textarea id="txtboxMultiline" required></textarea>
```

Khi trường văn bản là chỉ đọc, hãy biểu thị điều này bằng cách đặt `aria-readonly="true"` trên phần tử.

### Các thuộc tính ARIA liên quan

- Thuộc tính [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant)
  - : Lấy giá trị là ID của một phần tử con của phần tử đang có DOM focus hoặc là phần tử con logic như được chỉ ra bởi thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns), nó cho biết khi phần tử đó có focus, khi nó là một phần của widget tổ hợp như [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role). Ví dụ, trong một combobox, focus có thể vẫn ở textbox trong khi giá trị của `aria-activedescendant` trên phần tử textbox tham chiếu tới một phần tử con của listbox bật lên do textbox điều khiển. Thuộc tính này phải được cập nhật theo chương trình khi focus thay đổi.
- Thuộc tính [`aria-autocomplete`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete)
  - : Cho biết liệu và cách mà đầu vào của người dùng trong trường có thể kích hoạt việc hiển thị một dự đoán về giá trị dự định hay không. Nó hỗ trợ các giá trị sau:
    - `inline`: Văn bản dự đoán được chèn sau con trỏ.
    - `list`: Văn bản dự đoán được trình bày dưới dạng một tập hợp các giá trị.
    - `both`: Văn bản dự đoán được trình bày dưới dạng một tập hợp các giá trị, với phần văn bản cần để hoàn thành một giá trị được chèn sau con trỏ.
    - `none` (mặc định): Không cung cấp văn bản dự đoán.

    Nếu đặt list hoặc both, các thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) và [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup) cũng nên được bao gồm. Giá trị của `aria-controls` là ID của phần tử chứa danh sách các giá trị được gợi ý. Ngoài ra, hoặc textbox hoặc phần tử chứa mang vai trò `combobox` có một giá trị `aria-haspopup` khớp với vai trò của phần tử chứa danh sách các giá trị được gợi ý.

- Thuộc tính [`aria-multiline`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiline)
  - : Nếu đặt `aria-multiline="true"`, công nghệ hỗ trợ sẽ thông báo cho người dùng rằng textbox hỗ trợ nhập nhiều dòng, với kỳ vọng rằng <kbd>Enter</kbd> hoặc <kbd>Return</kbd> sẽ tạo ngắt dòng thay vì gửi biểu mẫu. ARIA không thay đổi hành vi của phần tử; thay vào đó tính năng này phải do nhà phát triển kiểm soát. Nếu đặt false, hoặc bỏ thuộc tính và mặc định là false, kỳ vọng của người dùng là điều khiển này là một hộp văn bản một dòng, và <kbd>Enter</kbd> hoặc <kbd>Return</kbd> sẽ gửi biểu mẫu.

- Thuộc tính [`aria-placeholder`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-placeholder)
  - : Đại diện cho một gợi ý (từ hoặc cụm từ) cho người dùng về nội dung cần nhập vào trường văn bản. Gợi ý nên là một giá trị mẫu hoặc mô tả ngắn về định dạng mong đợi. Thông tin này không nên được dùng thay cho nhãn: nhãn có thể focus, cố định, chỉ ra loại thông tin được mong đợi, và tăng vùng bấm để đặt focus lên điều khiển, trong khi văn bản placeholder chỉ là gợi ý tạm thời về giá trị mong đợi, và nếu triển khai sai có thể làm giảm khả năng truy cập. Placeholder nên hiển thị khi giá trị của điều khiển là chuỗi rỗng, chẳng hạn khi điều khiển vừa nhận focus lần đầu và khi người dùng xóa một giá trị đã nhập trước đó. Thay vì dùng `aria-placeholder`, hãy dùng phần tử ngữ nghĩa `<input type="text">` hoặc `<textarea>` với thuộc tính `placeholder`.
- Thuộc tính [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly)
  - : Cho biết người dùng không thể sửa đổi giá trị của trường văn bản. Thay vì dùng `aria-readonly`, hãy dùng phần tử ngữ nghĩa `<input type="text">` hoặc `<textarea>` với thuộc tính `readonly`.
- Thuộc tính [`aria-required`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required)
  - : Cho biết giá trị phải được cung cấp cho trường trước khi gửi. Thay vì dùng `aria-required`, hãy dùng phần tử ngữ nghĩa `<input type="text">` hoặc `<textarea>` với thuộc tính `required`.

### Tương tác bàn phím

Trong cách dùng một dòng (khi `aria-multiline` là `false` hoặc không dùng), phím Return hoặc Enter sẽ gửi biểu mẫu. Trong cách dùng nhiều dòng (khi `aria-multiline` là `true`), phím Return hoặc Enter sẽ chèn ngắt dòng.

### Tính năng JavaScript

Tất cả tính năng liên quan đến mọi thuộc tính và trạng thái phải được duy trì, và việc gửi biểu mẫu khi nhấn enter hoặc return trên textbox một dòng cần được xử lý.

- Trình xử lý sự kiện focus và thuộc tính aria-activedescendant
  - : Nếu bạn đang triển khai một widget tổ hợp, chẳng hạn combobox gồm một hộp văn bản và một listbox, bạn cần quản lý thuộc tính `aria-activedescendant` bằng một handler. Trước khi dùng kỹ thuật này, hãy đảm bảo các trình duyệt bạn cần nhắm đến hiện có hỗ trợ nó. Xem [đặc tả của aria-descendant](https://w3c.github.io/aria/#aria-activedescendant) để biết thêm chi tiết.

> [!NOTE]
> Nên dùng phần tử {{HTMLElement("input")}} kiểu `text`, hoặc phần tử {{HTMLElement("textarea")}} thay vì vai trò textbox của ARIA. Khi dùng một trong hai phần tử ngữ nghĩa này, vai trò textbox của ARIA là không cần thiết. Xem [Notes on Using ARIA in HTML](https://w3c.github.io/using-aria/).

## Tác động có thể có lên user agent và công nghệ hỗ trợ

Khi vai trò `textbox` được thêm vào một phần tử, hoặc phần tử như vậy trở nên hiển thị, user agent nên làm như sau:

- Hiển thị phần tử như có vai trò textbox trong API truy cập của hệ điều hành.
- Phát một sự kiện textbox có thể truy cập bằng API truy cập của hệ điều hành nếu nó hỗ trợ.

Các sản phẩm công nghệ hỗ trợ nên lắng nghe sự kiện như vậy và thông báo cho người dùng tương ứng:

- Trình đọc màn hình nên đọc nhãn và vai trò khi focus lần đầu rơi vào textbox. Nếu nó cũng có nội dung, nội dung đó nên được thông báo giống như với một textbox bình thường.
- Trình phóng đại màn hình có thể phóng to textbox.

> [!NOTE]
> Có thể có những quan điểm khác nhau về cách công nghệ hỗ trợ nên xử lý kỹ thuật này. Thông tin nêu ở trên là một trong những quan điểm đó và có thể được trải nghiệm khác đi.

## Ví dụ

### Ví dụ 1: Thêm vai trò trong mã HTML cho input một dòng

Đoạn mã dưới đây cho thấy vai trò textbox được thêm trực tiếp vào mã nguồn HTML.

```html
<div role="textbox" contenteditable="true"></div>
```

### Ví dụ 2: Thêm vai trò trong mã HTML cho input nhiều dòng

Đoạn mã dưới đây cho thấy vai trò textbox được thêm trực tiếp vào mã nguồn HTML.

```html
<div role="textbox" contenteditable="true" aria-multiline="true"></div>
```

## Thực hành tốt nhất

Hãy chắc chắn thêm thuộc tính `contenteditable="true"` vào phần tử HTML mà vai trò này được áp dụng. Hãy làm điều đó ngay cả khi bạn đặt `aria-readonly` thành `true`; như vậy, bạn truyền đạt rằng nội dung sẽ có thể chỉnh sửa nếu nó không chỉ đọc.

## Xem thêm

- [ARIA: search role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role)
