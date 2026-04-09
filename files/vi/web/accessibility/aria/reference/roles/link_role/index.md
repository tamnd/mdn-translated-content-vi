---
title: "ARIA: vai trò link"
short-title: link
slug: Web/Accessibility/ARIA/Reference/Roles/link_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#link
sidebar: accessibilitysidebar
---

Một widget `link` cung cấp một tham chiếu tương tác tới một tài nguyên. Tài nguyên đích có thể là bên ngoài hoặc cục bộ; tức là nằm ngoài hoặc trong trang hay ứng dụng hiện tại.

> [!NOTE]
> Khi có thể, bạn nên dùng phần tử {{HTMLElement("a")}} gốc thay vì vai trò `link`, vì các phần tử gốc được user agent và công nghệ hỗ trợ hỗ trợ rộng rãi hơn. Các phần tử {{HTMLElement("a")}} gốc cũng hỗ trợ yêu cầu về bàn phím và tiêu điểm theo mặc định, không cần tùy biến thêm.

## Mô tả

Vai trò `link` được dùng để xác định một phần tử tạo ra một siêu liên kết tới tài nguyên nằm trong ứng dụng hoặc bên ngoài.

Khi không dùng HTML ngữ nghĩa đúng mục đích, các tính năng tương tác phải được triển khai lại. Ví dụ, khi thêm `role="link"` vào một phần tử, phím <kbd>tab</kbd> nên cho phép đưa tiêu điểm vào liên kết và phím <kbd>enter</kbd> nên thực thi liên kết khi được focus.

Dùng thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) với giá trị `0` để bảo đảm liên kết nằm đúng thứ tự tab focus.

> [!WARNING]
> Việc áp dụng vai trò `link` lên một phần tử sẽ không khiến trình duyệt tăng cường phần tử đó với kiểu hiển thị hay hành vi liên kết chuẩn, như gạch chân, vòng focus, điều hướng tới đích liên kết hay các hành động menu ngữ cảnh. Đó là trách nhiệm của nhà phát triển.

## Ví dụ

Để tạo lại một liên kết có trợ năng bằng cách dùng vai trò `link` trên một phần tử không phải {{HTMLElement('a')}}, bạn cần bảo đảm liên kết nhận tiêu điểm theo đúng thứ tự tab, phần tử trông giống một liên kết, và "liên kết" hoạt động như một liên kết.

```html
<span data-href="https://mozilla.org" tabindex="0" role="link">
  Liên kết trợ năng giả được tạo bằng span
</span>
```

### CSS

```css
span[role="link"] {
  color: blue;
  text-decoration: underline;
  cursor: pointer;
}
span[role="link"]:hover,
span[role="link"]:active,
span[role="link"]:focus {
  color: purple;
}

span[role="link"]:focus {
  background-color: palegoldenrod;
  outline: 1px dotted;
}
```

### JavaScript

```js
const fakeLinks = document.querySelectorAll('[role="link"]');

for (const link of fakeLinks) {
  link.addEventListener("click", navigateLink);
  link.addEventListener("keydown", navigateLink);
}

// xử lý các sự kiện click và keydown trên liên kết
function navigateLink(e) {
  if (e.type === "click" || e.key === "Enter") {
    const ref = e.target ?? e.srcElement;
    if (ref) {
      window.open(ref.getAttribute("data-href"), "_blank");
    }
  }
}
```

Nếu phần tử có `role="link"` nhận sự kiện phím <kbd>Enter</kbd>, nó sẽ thực thi liên kết, đi tới trang được liên kết hoặc chuyển tiêu điểm tới đích trong trang.

Tùy chọn, <kbd>Shift</kbd> + <kbd>F10</kbd> sẽ mở menu ngữ cảnh cho liên kết.

## Thực hành tốt nhất

Các vai trò widget khác nhau được dùng để định nghĩa các mẫu tương tác phổ biến. Tương tự như các vai trò cấu trúc tài liệu, một số vai trò này, bao gồm `link`, lặp lại ngữ nghĩa của các phần tử HTML gốc vốn được hỗ trợ tốt, và không nên dùng.

Tránh dùng `link`, được đưa vào đây để đầy đủ. Có sẵn và được hỗ trợ một phần tử HTML tương đương về mặt ngữ nghĩa là {{HTMLElement('a')}} với khả năng tương tác có trợ năng.

### Ưu tiên HTML

Hãy dùng {{HTMLElement('a')}} thay thế.

> [!NOTE]
> Không cần thêm `role="link"` vào một liên kết HTML vì phần tử `<a>` mặc định đã có vai trò đó.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử {{HTMLElement('a')}}
- Phần tử {{HTMLElement('button')}}
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
- [Ví dụ vai trò `link` trong ARIA practices](https://www.w3.org/WAI/ARIA/apg/patterns/link/examples/link/)
