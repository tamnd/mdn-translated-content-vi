---
title: "ARIA: vai trò main"
short-title: main
slug: Web/Accessibility/ARIA/Reference/Roles/main_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#main
  - https://www.w3.org/WAI/ARIA/apg/patterns/landmarks/examples/main.html
sidebar: accessibilitysidebar
---

Vai trò vùng định vị `main` được dùng để chỉ nội dung chính của một tài liệu. Khu vực nội dung chính gồm nội dung liên quan trực tiếp đến hoặc mở rộng chủ đề trung tâm của tài liệu, hoặc chức năng chính của ứng dụng.

```html
<div id="main" role="main">
  <h1>Avocados</h1>
  <!-- main section content -->
</div>
```

Đây là phần chính của một tài liệu nói về quả bơ. Các phần con của tài liệu này có thể nói về lịch sử, các loại khác nhau, vùng trồng, v.v.

## Mô tả

Vai trò `main` là một vai trò [landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) mang tính điều hướng, xác định nội dung chính của một tài liệu. Landmark có thể được công nghệ hỗ trợ như trình đọc màn hình dùng để nhanh chóng xác định và điều hướng đến các phần lớn của tài liệu.

Bằng cách phân loại và gắn nhãn các phần của trang, thông tin cấu trúc được thể hiện bằng bố cục trực quan có thể được biểu diễn theo chương trình. Trình đọc màn hình dùng vai trò landmark để cung cấp điều hướng bằng bàn phím tới các phần quan trọng của trang. Với những người điều hướng bằng vai trò landmark, vai trò `main` là lựa chọn thay thế cho các liên kết "skip to main content".

Mỗi tài liệu chỉ nên có một vai trò `main` landmark.

Phần tử {{HTMLElement('main')}} có vai trò là `main`. Nhà phát triển nên ưu tiên dùng HTML ngữ nghĩa, ở đây là {{HTMLElement('main')}}, thay vì dùng ARIA.

### Các vai trò, trạng thái và thuộc tính ARIA liên quan

- [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns)
  - : Thuộc tính `aria-owns` thiết lập các mối quan hệ trong lớp truy cập không có sẵn trong DOM. Tài liệu và ứng dụng có thể lồng nhau trong DOM, điều này có thể dẫn đến việc có nhiều hơn một phần tử main là hậu duệ DOM. Nếu đúng như vậy, hãy bao gồm `aria-owns` để xác định mối quan hệ của main với phần tử cha là tài liệu hoặc ứng dụng.

- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc `aria-labelledby`
  - : Xác định tên truy cập được bằng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) nếu có một tiêu đề hiển thị. Nếu không, thêm [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) có thể hữu ích để định hướng người dùng công nghệ hỗ trợ, đặc biệt trong ứng dụng một trang, nơi nội dung chính thay đổi mà không tạo ra sự kiện tải trang.

## Ví dụ

```html
<body>
  <!-- primary navigation -->

  <div role="main">
    <h1>The First Indochina War</h1>
    <!-- article content -->
  </div>

  <!-- sidebar and footer -->
</body>
```

## Lưu ý về khả năng truy cập

### Chỉ dùng một vai trò `main` cho mỗi tài liệu

Vai trò [landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) `main` chỉ nên được dùng một lần cho mỗi tài liệu.

Nếu một tài liệu chứa hai vai trò `main`, chẳng hạn khi cập nhật nội dung trang bằng JavaScript, thì sự hiện diện của `main` không còn hoạt động cần được loại khỏi công nghệ hỗ trợ bằng các kỹ thuật như bật tắt [`hidden` attribute](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden).

```html
<main>
  <h1>Active `main` element</h1>
  <!-- content -->
</main>

<main hidden>
  <h1>Hidden `main` element</h1>
  <!-- content -->
</main>
```

Cũng nên thêm một tên truy cập được để giúp người dùng công nghệ hỗ trợ định hướng, đặc biệt trong ứng dụng một trang, nơi nội dung chính thay đổi mà không tạo ra sự kiện tải trang. Việc này có thể thực hiện bằng `aria-labelledby` nếu có tên thích hợp trong nội dung, hoặc `aria-label` nếu không có.

## Thực hành tốt nhất

### Ưu tiên HTML

Việc dùng phần tử {{HTMLElement('main')}} sẽ tự động truyền đạt rằng phần tử có vai trò `main`. Nếu có thể, hãy ưu tiên dùng phần tử ngữ nghĩa `<main>` thay vì vai trò `main`.

### Bỏ qua điều hướng

Skip navigation, còn gọi là "skipnav", là một kỹ thuật cho phép người dùng công nghệ hỗ trợ nhanh chóng bỏ qua các phần nội dung lặp lại lớn (điều hướng chính, banner thông tin, v.v.). Điều này giúp người dùng truy cập nhanh hơn vào nội dung chính của trang.

Thêm một [`id` attribute](/en-US/docs/Web/HTML/Reference/Global_attributes/id) cho phần tử có khai báo `role="main"` cho phép nó trở thành mục tiêu của liên kết skip navigation.

```html
<body>
  <a href="#main-content">Skip to main content</a>

  <!-- navigation and header content -->

  <div id="main-content" role="main">
    <!-- main page content -->
  </div>
</body>
```

Tương đương với:

```html
<body>
  <a href="#main-content">Skip to main content</a>

  <!-- navigation and header content -->

  <main id="main-content">
    <!-- main page content -->
  </main>
</body>
```

- [WebAIM: "Skip Navigation" Links](https://webaim.org/techniques/skipnav/)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Phần tử {{HTMLElement('main')}}
- [Sử dụng các phần và dàn trang HTML](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements)
- [Accessible Landmarks | scottohara.me](https://www.scottohara.me/blog/2018/03/03/landmarks.html)
- [The main element | HTML5 Doctor](https://html5doctor.com/the-main-element/)
