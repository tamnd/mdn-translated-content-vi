---
title: "ARIA: vai trò toolbar"
short-title: toolbar
slug: Web/Accessibility/ARIA/Reference/Roles/toolbar_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#toolbar
  - https://www.w3.org/WAI/ARIA/apg/patterns/toolbar/examples/toolbar/
sidebar: accessibilitysidebar
---

Vai trò `toolbar` xác định phần tử chứa là một tập hợp các nút chức năng hoặc điều khiển thường dùng, được biểu diễn theo dạng trực quan gọn.

## Mô tả

Toolbar là một tập hợp các điều khiển thường dùng, như nút hoặc hộp kiểm, được nhóm lại trong một dạng trực quan gọn. Vai trò `toolbar` có thể được dùng để truyền đạt sự hiện diện và mục đích của nhóm như vậy cho người dùng trình đọc màn hình và có thể giúp giảm số điểm dừng tab cho người dùng bàn phím. Chỉ dùng vai trò `toolbar` để nhóm từ 3 điều khiển trở lên.

Toolbar thường là một tập con các chức năng có trong `menubar` như một cách giảm công sức cho người dùng. Nếu bạn có nhiều hơn một toolbar trong một menubar, mỗi toolbar cần có nhãn; bạn có thể thêm nhãn đó bằng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) hoặc [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label).

Khi tạo toolbar, bạn cần triển khai quản lý focus và tương tác bàn phím bên trong toolbar, xử lý các trường hợp khi cùng một tương tác bàn phím được dùng cả trong toolbar lẫn trong điều khiển gốc được bao gồm. <kbd>Left Arrow</kbd> và <kbd>Right Arrow</kbd> nên được dùng để điều hướng giữa các điều khiển trong thanh công cụ ngang. <kbd>Up Arrow</kbd> và <kbd>Down Arrow</kbd> nên được dùng nếu toolbar là dọc - trong trường hợp đó bạn cũng nên bao gồm `aria-orientation="vertical"` - hoặc trong một toolbar ngang, có thể được dành cho việc vận hành các điều khiển, như spin button cần phím mũi tên dọc để hoạt động.

Tránh bao gồm các điều khiển có thao tác yêu cầu các phím mũi tên được dùng cho điều hướng toolbar. Nếu bắt buộc phải bao gồm một điều khiển như vậy, hãy đặt nó là điều khiển cuối cùng trong toolbar. Ví dụ, trong một toolbar ngang, có thể đặt textbox là phần tử cuối cùng.

Nếu bất kỳ phần tử tương tác nào khác trong toolbar tạm thời bị vô hiệu hóa, hãy cân nhắc để chúng vẫn có thể focus để người dùng trình đọc màn hình biết chúng vẫn hiện diện.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation)
  - : Các phần tử mang vai trò toolbar có giá trị `aria-orientation` ngầm định là horizontal.

- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) / [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Nếu toolbar có nhãn hiển thị, hãy tham chiếu nó bằng ID với thuộc tính `aria-labelledby`. Nếu không, hãy cung cấp `aria-label`. Nếu có nhiều hơn một toolbar trong một menu, việc đặt tên là bắt buộc.

### Tương tác bàn phím

Triển khai quản lý focus để chuỗi tab bàn phím có một điểm dừng cho toolbar và các phím mũi tên di chuyển focus giữa các điều khiển trong toolbar.

- <kbd>Tab</kbd> và <kbd>Shift + Tab</kbd>
  - : Di chuyển focus vào và ra khỏi toolbar. Khi focus di chuyển vào toolbar:
    - Nếu đây là lần đầu focus đi vào toolbar, focus được đặt lên điều khiển đầu tiên không bị vô hiệu hóa.
    - Nếu toolbar trước đó đã chứa focus, focus tùy chọn được đặt lên điều khiển đã từng có focus gần nhất. Nếu không, nó được đặt lên điều khiển đầu tiên không bị vô hiệu hóa.

- <kbd>Home</kbd> (Tùy chọn)
  - : Di chuyển focus đến phần tử đầu tiên.

- <kbd>End</kbd> (Tùy chọn)
  - : Di chuyển focus đến phần tử cuối cùng.

#### Toolbar ngang

Các phần tử mang vai trò toolbar có giá trị `aria-orientation` ngầm định là horizontal. Nếu toolbar thực sự có hướng này, cần triển khai các tương tác bàn phím sau:

- <kbd>Left Arrow</kbd>
  - : Di chuyển focus đến điều khiển trước đó. Tùy chọn, việc di chuyển focus có thể vòng từ phần tử đầu tiên sang phần tử cuối cùng.

- <kbd>Right Arrow</kbd>
  - : Di chuyển focus đến điều khiển kế tiếp. Tùy chọn, việc di chuyển focus có thể vòng từ phần tử cuối cùng sang phần tử đầu tiên.

Trong toolbar có nhiều hàng điều khiển, hãy cho phép mũi tên trái và phải vòng từ hàng này sang hàng khác, đồng thời dành quyền cho các phím mũi tên dọc để vận hành các điều khiển, như di chuyển giữa các radio button, hoặc tăng/giảm một spinner số.

#### Toolbar dọc

Nếu toolbar là dọc, hãy đảm bảo đặt `aria-orientation="vertical"` và triển khai các tương tác bàn phím sau:

- <kbd>Up Arrow</kbd>
  - : Di chuyển focus đến điều khiển trước đó. Tùy chọn, việc di chuyển focus có thể vòng từ phần tử đầu tiên sang phần tử cuối cùng.

- <kbd>Down Arrow</kbd>
  - : Di chuyển focus đến điều khiển tiếp theo. Tùy chọn, việc di chuyển focus có thể vòng từ phần tử cuối cùng sang phần tử đầu tiên.

### Tính năng JavaScript bắt buộc

Triển khai quản lý focus để chuỗi tab bàn phím có một điểm dừng cho toolbar và các phím mũi tên di chuyển focus giữa các điều khiển trong toolbar. Khi tab vào toolbar, focus quay trở lại điều khiển từng có focus gần nhất.

Mặc dù bản thân phần tử toolbar không nhận focus, focus khi di chuyển vào, ra khỏi và bên trong toolbar vẫn phải được quản lý. Khi tải trang, phần tử đầu tiên trong chuỗi tab bên trong toolbar có `tabindex="0"` với `tabindex="-1"` trên tất cả phần tử có thể focus khác bên trong toolbar. Tùy theo [tương tác bàn phím], phần tử nhận focus sẽ được đặt thành `tabindex="0"` và phần tử vừa mất focus sẽ được chuyển lại `tabindex="-1"`. Đặt focus, `element.focus()`, lên phần tử có `tabindex="0"`. Điều này được gọi là "roving tabindex". Một lợi ích của roving tabindex để quản lý focus là trình duyệt sẽ cuộn phần tử vừa được focus vào vùng nhìn thấy.

Nếu thiết kế yêu cầu một phần tử cụ thể được focus lần tiếp theo khi người dùng di chuyển focus vào toolbar bằng <kbd>Tab</kbd> hoặc <kbd>Shift + Tab</kbd>, hãy kiểm tra xem phần tử mục tiêu đó có `tabindex="0"` hay không khi toolbar mất focus.

Khi toolbar có focus bên trong nó, hãy cung cấp tín hiệu trực quan. Khi một phần tử trong toolbar có focus, cần có tín hiệu trực quan trên cả chính toolbar - để giúp cho biết toolbar hỗ trợ điều hướng bằng phím mũi tên - và điều khiển đang có focus. Có thể dùng các pseudo-class CSS `:focus` và `:focus-within` để nhắm đến cả hai phần tử.

## Ví dụ

[Ví dụ toolbar từ ARIA Authoring Practices Guide (APG)](https://www.w3.org/WAI/ARIA/apg/patterns/toolbar/)

## Lưu ý về khả năng truy cập

Tránh bao gồm các điều khiển có thao tác yêu cầu các phím mũi tên được dùng cho điều hướng toolbar (mũi tên trái và phải, hoặc trên và dưới đối với toolbar dọc). Nếu bắt buộc phải bao gồm một điều khiển như vậy, hãy đặt nó là điều khiển cuối cùng trong toolbar. Ví dụ, trong một toolbar ngang, có thể đặt textbox là phần tử cuối cùng.

Nếu bất kỳ phần tử tương tác nào khác trong toolbar bị vô hiệu hóa, hãy cân nhắc để chúng vẫn có thể focus để người dùng trình đọc màn hình biết chúng vẫn hiện diện.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [The CSS `:focus` pseudoclass](/en-US/docs/Web/CSS/Reference/Selectors/:focus)
- [The CSS `:focus-within` pseudoclass](/en-US/docs/Web/CSS/Reference/Selectors/:focus-within)
