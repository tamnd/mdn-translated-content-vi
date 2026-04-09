---
title: "ARIA: vai trò img"
short-title: img
slug: Web/Accessibility/ARIA/Reference/Roles/img_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#img
sidebar: accessibilitysidebar
---

Vai trò ARIA `img` có thể được dùng để xác định nhiều phần tử bên trong nội dung trang nên được xem như một hình ảnh duy nhất. Những phần tử này có thể là hình ảnh, đoạn mã, văn bản, emoji hoặc nội dung khác có thể kết hợp để truyền tải thông tin theo cách trực quan.

```html
<div role="img" aria-label="Mô tả của toàn bộ hình ảnh">
  <img src="graphic1.png" alt="" />
  <img src="graphic2.png" alt="" />
</div>
```

## Mô tả

Bất kỳ tập hợp nội dung nào nên được tiếp nhận như một hình ảnh duy nhất (có thể gồm hình ảnh, video, âm thanh, đoạn mã, emoji, hoặc nội dung khác) đều có thể được xác định bằng `role="img"`.

Bạn không nên dựa vào văn bản alt của từng hình ảnh riêng lẻ để truyền đạt ngữ cảnh cho công nghệ hỗ trợ; hầu hết trình đọc màn hình sẽ xem phần tử có `role="img"` như một khối đen và không truy cập các phần tử con bên trong. Vì vậy, hãy cung cấp văn bản thay thế tổng thể, đầy đủ mô tả cho hình ảnh, либо trong văn bản xung quanh, либо bằng cách dùng thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label), với các thuộc tính `alt` dành cho công cụ tìm kiếm hoặc người dùng nhìn thấy để hiển thị trên trang nếu ảnh không tải được:

```html
<div role="img" aria-label="Mô tả của toàn bộ hình ảnh">
  <img src="graphic1.png" alt="văn bản thay thế" />
  <img src="graphic2.png" alt="trong trường hợp ảnh không tải" />
</div>
```

Nếu bạn muốn thêm chú thích hoặc nhãn cho hình ảnh mà người dùng nhìn thấy trên trang, bạn có thể dùng:

- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) khi văn bản là một nhãn ngắn gọn.
- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) khi văn bản là một mô tả dài hơn.

Ví dụ:

```html
<div role="img" aria-labelledby="image-1">
  …
  <p id="image-1">Văn bản mô tả nhóm hình ảnh.</p>
</div>
```

Nếu hình ảnh chỉ mang tính trình bày, hãy cân nhắc dùng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role).

### SVG và role="img"

Nếu bạn đang dùng ảnh SVG nhúng trong trang, nên đặt `role="img"` trên phần tử {{SVGElement('svg')}} bên ngoài và gán cho nó một nhãn. Điều này sẽ khiến trình đọc màn hình chỉ xem nó như một thực thể duy nhất và mô tả bằng nhãn đó, thay vì cố đọc tất cả các nút con:

```html
<svg role="img" aria-label="Mô tả của ảnh SVG của bạn">
  <!-- nội dung của ảnh SVG -->
</svg>
```

### Dùng role="img" để truyền đạt ý nghĩa bị che khuất hoặc được ngụ ý

Trong một số trường hợp, người dùng công nghệ hỗ trợ sẽ không thể hiểu được ý nghĩa của nội dung được biểu đạt theo một số cách nhất định, thông qua một số phương tiện nhất định, hoặc được ngụ ý theo cách nào đó. Việc này dễ sửa đối với hình ảnh (bạn có thể dùng thuộc tính `alt`), nhưng với nội dung hỗn hợp hoặc một số loại nội dung khác thì không rõ ràng như vậy, và `role="img"` có thể được dùng.

Ví dụ, nếu bạn dùng emoji trong văn bản, ý nghĩa có thể rõ với người nhìn thấy, nhưng người dùng trình đọc màn hình có thể bị nhầm vì emoji có thể không có biểu diễn văn bản nào, hoặc văn bản thay thế có thể gây nhầm lẫn và không khớp với ngữ cảnh đang dùng. Ví dụ, hãy xét mã sau:

```html
<div role="img" aria-label="Con mèo đó dễ thương quá">
  <p>&#x1F408; &#x1F602;</p>
</div>
```

`&#x1F408; &#x1F602;`, 🐈 và 😂, là tham chiếu thực thể cho emoji được đọc là "Cat" và "Face with tears of joy", nhưng điều đó không nhất thiết có ý nghĩa - ý nghĩa ngụ ý có thể giống như "Con mèo đó dễ thương quá", vì vậy chúng ta đưa ý đó vào `aria-label` cùng với `role="img"`.

Điều này có vẻ hoạt động ổn trong một số kết hợp trình duyệt/trình đọc màn hình, nhưng một số trường hợp lại đọc nhãn hai lần. Hãy dùng cẩn thận và kiểm thử kỹ.

Một ví dụ khác nơi cách này có thể phù hợp là khi dùng các tổ hợp emoji ASCII, như "Table flip" huyền thoại:

```html
<div role="img" aria-label="Lật bàn">
  <p>(╯°□°）╯︵ ┻━┻</p>
</div>
```

Nếu dùng `aria-labelledby`, trình đọc màn hình sẽ đọc nó. Trong trường hợp này, chỉ nội dung của `aria-label` được thông báo cho người dùng trình đọc màn hình, che đi mớ ký tự vô nghĩa mà không cần ARIA con để ẩn nội dung, nhưng cũng che luôn phần nội dung tiềm năng có thể là một phần của hình ảnh.

### Tất cả phần tử con đều mang tính trình bày

Có một số loại thành phần giao diện người dùng mà khi được biểu diễn trong API trợ năng của nền tảng thì chỉ có thể chứa văn bản. Các API trợ năng không có cách biểu diễn các phần tử ngữ nghĩa được chứa bên trong `img`. Để xử lý giới hạn này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho tất cả phần tử con của bất kỳ phần tử `img` nào, vì đây là vai trò không hỗ trợ phần tử con ngữ nghĩa.

Ví dụ, hãy xét phần tử `img` sau, có chứa một tiêu đề.

```html
<div role="img"><h3>Tiêu đề của hình ảnh của tôi</h3></div>
```

Vì phần tử con của `img` mang tính trình bày, mã sau là tương đương:

```html
<div role="img"><h3 role="presentation">Tiêu đề của hình ảnh của tôi</h3></div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước tương đương với nội dung sau trong [cây khả năng truy cập](/en-US/docs/Glossary/Accessibility_tree).:

```html
<div role="img">Tiêu đề của hình ảnh của tôi</div>
```

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- `aria-label` hoặc `aria-labelledby`
  - : Cần có một tên truy cập. Với phần tử HTML {{HTMLElement('img')}}, hãy dùng thuộc tính `alt`. Với mọi phần tử khác có vai trò `img`, hãy dùng `aria-labelledby` nếu có nhãn hiển thị, nếu không thì dùng `aria-label`.

## Ví dụ

```html
<span role="img" aria-label="Xếp hạng: 4 trên 5 sao">
  <span>★</span>
  <span>★</span>
  <span>★</span>
  <span>★</span>
  <span>☆</span>
</span>
```

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử {{HTMLElement('img')}}
- Phần tử {{SVGElement('svg')}}
- Phần tử {{HTMLElement('picture')}}
- Phần tử {{HTMLElement('audio')}}
- Phần tử {{HTMLElement('video')}}
- [ARIA: vai trò `presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role)
- [Accessibility Object Model](https://wicg.github.io/aom/spec/)
- [ARIA in HTML](https://w3c.github.io/html-aria/)
