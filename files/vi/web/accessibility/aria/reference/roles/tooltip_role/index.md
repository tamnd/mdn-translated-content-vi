---
title: "ARIA: vai trò tooltip"
short-title: tooltip
slug: Web/Accessibility/ARIA/Reference/Roles/tooltip_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#tooltip
sidebar: accessibilitysidebar
---

`tooltip` là một bong bóng văn bản theo ngữ cảnh hiển thị mô tả cho một phần tử xuất hiện khi rê chuột hoặc focus bằng bàn phím.

## Mô tả

Tooltip cung cấp thông tin theo ngữ cảnh về một phần tử khi phần tử sở hữu nhận focus hoặc được rê chuột qua, nhưng nếu không thì không hiển thị trên trang. Tooltip được hiển thị tự động, sau một khoảng trễ ngắn; người dùng không yêu cầu nó. Mặc dù tooltip có thể được đặt trên bất kỳ nội dung nào, nó thường là mẹo cho công cụ hoặc điều khiển, như cung cấp nội dung bổ sung cho các biểu tượng có nhãn ngắn (hoặc không có nhãn, điều này là không thể truy cập!).

Tooltip thường trở nên hiển thị sau một khoảng trễ ngắn, thường là một đến năm giây, khi rê chuột, hoặc sau khi phần tử sở hữu nhận focus bằng bàn phím. Giống như cách nó mở tự động, không có yêu cầu từ người dùng, nó sẽ tự động đóng khi mất focus hoặc khi chuột rời đi. Nó phải luôn mở khi chuột di chuyển lên chính tooltip, và cũng nên đóng khi người dùng nhấn phím <kbd>Escape</kbd>.

Vì bản thân tooltip không bao giờ nhận focus và không nằm trong thứ tự tab, tooltip không thể chứa các phần tử tương tác như liên kết, input, hoặc nút.

Tooltip không phải là vai trò phù hợp cho biểu tượng "i" chứa thêm thông tin, ⓘ. Tooltip được liên kết trực tiếp với phần tử sở hữu. ⓘ không phải là thứ được "mô tả bởi" thông tin chi tiết; công cụ hoặc điều khiển mới là đối tượng đó.

Việc dùng vai trò ARIA `tooltip` là phần bổ sung cho hành vi tooltip mặc định của trình duyệt. Một ví dụ về tooltip gốc của trình duyệt là cách một số trình duyệt hiển thị [`title` attribute](/en-US/docs/Web/HTML/Reference/Global_attributes/title) của phần tử khi rê chuột lâu. Không thể kích hoạt tính năng này bằng focus bàn phím hoặc qua tương tác cảm ứng, nên tính năng này là không thể truy cập. Nếu thông tin đủ quan trọng để đưa vào tooltip hoặc title, hãy cân nhắc đưa nó vào văn bản hiển thị.

Các phần tử mang vai trò `tooltip` nên được tham chiếu thông qua [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) trước hoặc khi tooltip được hiển thị. Thuộc tính `aria-describedby` nằm trên phần tử sở hữu, không phải trên tooltip.

Tooltip không được xem là một popup theo thuộc tính [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup) trên phần tử sở hữu, đó là lý do tại sao phần định nghĩa ở đầu dùng "bong bóng văn bản".

Mặc dù tooltip có thể xuất hiện và biến mất, vì việc xuất hiện của nó là tự động và không được người dùng điều khiển có chủ ý, thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) không được hỗ trợ.

Tên truy cập được của tooltip có thể lấy từ nội dung của nó. Mặc dù về lý thuyết chúng có thể đến từ [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby), trong hầu hết trường hợp, không khuyến khích dùng thuộc tính ARIA để cung cấp tên truy cập được cho tooltip.

Tooltip cung cấp thêm thông tin, thường không có tương tác trực tiếp trên chính tooltip. Chúng thường được liên kết với nội dung mà chúng định nghĩa thông qua [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) với `id` của phần tử chính. Vì vậy, nếu tooltip có tên truy cập được được đặt rõ ràng, tên đó sẽ được hiển thị như phần mô tả của phần tử chính thay vì nội dung của tooltip, nghĩa là người dùng trình đọc màn hình có thể không bao giờ khám phá ra nội dung tooltip.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- Phần tử đóng vai trò vùng chứa tooltip có `role="tooltip"`.
- Phần tử kích hoạt tooltip tham chiếu phần tử tooltip bằng [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby).

### Tương tác bàn phím

- <kbd>Escape</kbd>
  - : Đóng tooltip

Tooltip nên xuất hiện khi focus hoặc khi phần tử được rê chuột qua, mà không cần tương tác thêm. Nó nên tự động biến mất khi focus trên phần tử sở hữu bị mất hoặc chuột rời khỏi phần tử sở hữu và tooltip. Mặc dù tooltip không nhận focus, phím <kbd>Escape</kbd> vẫn nên đóng nó nếu nó đang mở.

### Tính năng JavaScript bắt buộc

- Tooltip được hiển thị và biến mất thông qua focus bàn phím và mất focus, cũng như bằng các sự kiện chuột - rê chuột vào và rê chuột ra.

- Tooltip không bao giờ nhận focus. Focus luôn ở phần tử sở hữu.

- Tooltip có thể được ẩn bằng phím <kbd>Escape</kbd>

- Tooltip vẫn mở khi đang được rê chuột qua

- Tooltip chỉ được ẩn thông qua JavaScript và các bộ chọn CSS. Nếu không có JavaScript, tooltip sẽ được hiển thị.

## Ví dụ

```html
<label for="password">Password:</label>
<input aria-describedby="passwordrules" id="password" type="password" />
<div role="tooltip" id="passwordrules">
  <p>Password Rules:</p>
  <ul>
    <li>Minimum of 8 characters</li>
    <li>
      Include at least one lowercase letter, one uppercase letter, one number
      and one special character
    </li>
    <li>Unique to this website</li>
  </ul>
</div>
```

Tooltip có thể được khởi tạo bằng CSS. Thay đổi tên lớp bằng JavaScript thành một lớp ẩn tooltip nếu người dùng nhấn phím <kbd>Escape</kbd>.

```css
[role="tooltip"] {
  visibility: hidden;
  position: absolute;
  top: 2rem;
  left: 2rem;
  background: black;
  color: white;
  padding: 0.5rem;
  border-radius: 0.25rem;
  /* Give some time before hiding so mouse can exit the input
  and enter the tooltip */
  transition: visibility 0.5s;
}
[aria-describedby]:hover,
[aria-describedby]:focus {
  position: relative;
}
[aria-describedby]:hover + [role="tooltip"],
[aria-describedby]:focus + [role="tooltip"],
[role="tooltip"]:hover,
[role="tooltip"]:focus {
  visibility: visible;
}
```

{{EmbedLiveSample("examples", "", 300)}}

Phần trên ẩn tooltip bằng CSS ở trạng thái mặc định hoặc nếu lớp `hide-tooltip` đã được thêm bằng JavaScript (khi người dùng nhấn <kbd>Escape</kbd>), với độ đặc hiệu cao để đảm bảo tooltip không hiển thị. Khi phần tử sở hữu nhận focus, nó được đặt vị trí tương đối và tooltip trở nên hiển thị. Chúng ta giữ tooltip hiển thị khi rê chuột lên tooltip, phù hợp với [WCAG 1.4.13](#accessibility_concerns). Ở đây, chúng ta cho phép con trỏ di chuyển từ input sang tooltip mà không làm tooltip biến mất bằng cách chờ 0,5 giây ở giữa; còn có những cách khác để đạt được điều này, chẳng hạn lấp khoảng trống bằng một phần tử trong suốt cũng giữ tooltip hiển thị khi được rê chuột qua.

## Lưu ý về khả năng truy cập

Nếu thông tin đủ quan trọng để đưa vào một tooltip, chẳng phải nó cũng đủ quan trọng để luôn hiển thị sao?

Tooltip phải luôn mở khi được rê chuột qua, ngay cả khi điều đó có nghĩa là con chuột đã rời khỏi phần tử sở hữu. Vì nội dung xuất hiện khi rê chuột có thể khó hoặc không thể cảm nhận nếu người dùng phải giữ con trỏ chuột trên phần kích hoạt, [WCAG 1.4.13](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background) quy định rằng nội dung được làm hiển thị phải có tính bền vững, nghĩa là nó không nên biến mất mà không có hành động của người dùng.

## Thực hành tốt nhất

Thay vì dùng tooltip và ẩn thông tin quan trọng, hãy cân nhắc viết các mô tả rõ ràng, ngắn gọn và luôn hiển thị. Nếu bạn có không gian, đừng dùng tooltip hay toggletip. Chỉ cần cung cấp nhãn rõ ràng và đủ nội dung mô tả.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [The `dialog` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role)
- [CSS: `:focus` pseudoclass](/en-US/docs/Web/CSS/Reference/Selectors/:focus)
- [Tooltips & Toggletips](https://inclusive-components.design/tooltips-toggletips/) by Heydon Pickering
- [Understanding SC 1.4.13:Content on Hover or Focus (WCAG Level AA)](https://www.w3.org/WAI/WCAG21/Understanding/content-on-hover-or-focus.html)
