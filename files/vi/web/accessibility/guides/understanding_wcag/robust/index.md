---
title: Bền vững
slug: Web/Accessibility/Guides/Understanding_WCAG/Robust
page-type: guide
sidebar: accessibilitysidebar
---

Bài viết này cung cấp lời khuyên thực tế về cách viết nội dung web của bạn để nội dung đó tuân thủ các tiêu chí thành công được nêu trong nguyên tắc **Bền vững** của Web Content Accessibility Guidelines (WCAG) 2.0 và 2.1. Bền vững nói rằng nội dung phải đủ bền vững để có thể được diễn giải một cách đáng tin cậy bởi nhiều loại user agent, bao gồm công nghệ hỗ trợ. Điều này thường có thể đạt được bằng cách tuân theo các tiêu chuẩn web và [kiểm thử nghiêm ngặt](/en-US/docs/Learn_web_development/Extensions/Testing).

> [!NOTE]
> Để đọc định nghĩa của W3C về Bền vững cùng các hướng dẫn và tiêu chí thành công của nó, xem [Nguyên tắc 4: Bền vững — Nội dung phải đủ bền vững để có thể được diễn giải một cách đáng tin cậy bởi nhiều loại user agent, bao gồm công nghệ hỗ trợ.](https://w3c.github.io/wcag/guidelines/22/#robust)

## Hướng dẫn 4.1 — Tương thích: Tối đa hóa khả năng tương thích với user agent hiện tại và tương lai, bao gồm công nghệ hỗ trợ

Hướng dẫn này tập trung vào việc làm cho nội dung tương thích tốt nhất có thể, không chỉ với các user agent hiện tại (ví dụ: trình duyệt), mà còn với cả các user agent tương lai.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Tiêu chí thành công</th>
      <th scope="col">Cách đáp ứng tiêu chí</th>
      <th scope="col">Tài nguyên thực hành</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>4.1.1 Phân tích cú pháp (A)</td>
      <td>
        <p>
          Nội dung nên được tạo đúng cấu trúc để trình duyệt và các user agent khác như trình đọc màn hình có thể phân tích thành công.
        </p>
        <p>
          Để đạt tiêu chí này, hãy đảm bảo HTML của bạn hợp lệ nhất có thể. Dùng
          <a href="https://validator.w3.org/">W3C validator</a> để kiểm tra
          mã đánh dấu của bạn.
        </p>
      </td>
      <td>
        Xem
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Debugging_HTML"
          >Gỡ lỗi HTML</a
        >
        để có hướng dẫn thực hành.
      </td>
    </tr>
    <tr>
      <td>4.1.2 Tên, vai trò, giá trị (A)</td>
      <td>
        <p>
          Tên và vai trò của các thành phần giao diện người dùng (ví dụ: input form, nút, liên kết, v.v.) nên có thể xác định được theo chương trình.
        </p>
        <p>
          Khi dùng đúng các phần tử ngữ nghĩa cho mục đích vốn có của chúng, tiêu chí này sẽ tự động được đáp ứng. Khi lập trình các thành phần tùy chỉnh, bạn cần dùng vai trò WAI-ARIA và các tính năng khác để đảm bảo các điều khiển của bạn sẽ được diễn giải và có thể sử dụng như dự định, ví dụ không chỉ cho người dùng dùng chuột mà còn cho người dùng trình đọc màn hình, người dùng chỉ bàn phím, v.v.
        </p>
      </td>
      <td>
        Xem
        <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML"
          >HTML: Nền tảng tốt cho khả năng truy cập</a
        >
        và
        <a href="/en-US/docs/Learn_web_development/Core/Accessibility/WAI-ARIA_basics"
          >Kiến thức cơ bản về WAI-ARIA</a
        >.
      </td>
    </tr>
    <tr>
      <td>
        4.1.3 Thông báo trạng thái (AA)
      </td>
      <td>
        <p>
          Người dùng công nghệ hỗ trợ được thông báo về các thông báo trạng thái mới được thêm vào trang.
        </p>
      </td>
      <td>
        <a
          href="https://www.w3.org/WAI/WCAG21/Understanding/status-messages.html"
          >Tìm hiểu thông báo trạng thái</a
        >
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Cũng xem mô tả WCAG cho [Guideline 4.1: Compatible: Maximize compatibility with current and future user agents, including assistive technologies.](https://w3c.github.io/wcag/guidelines/22/#compatible)

## Xem thêm

- [WCAG](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG)
  1. [Perceivable](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable)
  2. [Operable](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable)
  3. [Understandable](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Understandable)
  4. Bền vững
