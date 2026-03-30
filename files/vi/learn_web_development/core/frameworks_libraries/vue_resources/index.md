---
title: Tài nguyên Vue
slug: Learn_web_development/Core/Frameworks_libraries/Vue_resources
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Core/Frameworks_libraries/Vue_refs_focus_management", "Learn_web_development/Core/Frameworks_libraries")}}

Bây giờ chúng ta sẽ kết thúc nghiên cứu Vue bằng cách cung cấp cho bạn danh sách các tài nguyên bạn có thể sử dụng để tiếp tục học hỏi, cùng với một số mẹo hữu ích khác.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a> và
          <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
          kiến thức về
          <a
            href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/dòng lệnh</a
          >.
        </p>
        <p>
          Các thành phần Vue được viết như một sự kết hợp của các đối tượng JavaScript quản lý dữ liệu của ứng dụng và cú pháp mẫu dựa trên HTML ánh xạ tới cấu trúc DOM bên dưới. Để cài đặt và sử dụng một số tính năng nâng cao hơn của Vue (như Single File Components hoặc render functions), bạn sẽ cần một terminal có node + npm được cài đặt.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu nơi để tìm thêm thông tin về Vue, để tiếp tục học hỏi.
      </td>
    </tr>
  </tbody>
</table>

## Tài nguyên bổ sung

Đây là nơi bạn nên đến để tìm hiểu thêm về Vue:

- [Vue Docs](https://vuejs.org/) — Trang web Vue chính. Chứa tài liệu toàn diện, bao gồm ví dụ, sách hướng dẫn và tài liệu tham chiếu. Đây là nơi tốt nhất để bắt đầu tìm hiểu Vue sâu hơn.
- [Vue GitHub Repo](https://github.com/vuejs/vue) — Code Vue. Đây là nơi bạn có thể báo cáo các vấn đề và/hoặc đóng góp trực tiếp vào codebase Vue. Nghiên cứu code nguồn Vue có thể giúp bạn hiểu rõ hơn về cách framework hoạt động và viết code tốt hơn.
- [Vue Discussions](https://github.com/vuejs/core/discussions) — Diễn đàn chính thức để được giúp đỡ với Vue.
- [Vue CLI Docs](https://cli.vuejs.org/) — Tài liệu cho Vue CLI. Điều này chứa thông tin về tùy chỉnh và mở rộng đầu ra bạn đang tạo qua CLI.
- [Nuxt](https://nuxt.com/) — Nuxt là một Framework Vue phía Máy chủ, với một số ý kiến kiến trúc có thể hữu ích để tạo ra các ứng dụng có thể bảo trì, ngay cả khi bạn không sử dụng bất kỳ tính năng Kết xuất phía Máy chủ nào mà nó cung cấp. Trang web này cung cấp tài liệu chi tiết về cách sử dụng Nuxt.
- [Vue Mastery](https://www.vuemastery.com/courses/) — Một nền tảng giáo dục trả phí chuyên về Vue, bao gồm một số bài học miễn phí.
- [Vue School](https://vueschool.io/) — Một nền tảng giáo dục trả phí khác chuyên về Vue.

## Xây dựng và xuất bản ứng dụng Vue của bạn

Vue CLI cũng cung cấp cho chúng ta các công cụ để chuẩn bị ứng dụng xuất bản lên web. Bạn có thể làm điều này như sau:

- Nếu máy chủ cục bộ của bạn vẫn đang chạy, hãy kết thúc nó bằng cách nhấn <kbd>Ctrl</kbd> \+ <kbd>C</kbd> trong terminal.

- Tiếp theo, chạy `npm run build` (hoặc `yarn build`) trong console.

Điều này sẽ tạo ra một thư mục `dist` mới chứa tất cả các file sẵn sàng cho sản xuất. Để xuất bản trang web của bạn lên web, hãy sao chép nội dung của thư mục này vào môi trường lưu trữ của bạn.

> [!NOTE]
> Tài liệu Vue CLI cũng bao gồm [hướng dẫn cụ thể về cách xuất bản ứng dụng](https://cli.vuejs.org/guide/deployment.html#platform-guides) lên nhiều nền tảng lưu trữ phổ biến.

## Vue 2

Hỗ trợ Vue 2 sẽ kết thúc vào ngày 31 tháng 12 năm 2023 và phiên bản Vue mặc định cho tất cả các công cụ CLI sẽ là phiên bản 3 trở lên.
[Composition API](https://vuejs.org/guide/extras/composition-api-faq.html) hoạt động như một thay thế cho API dựa trên thuộc tính nơi hàm `setup()` được sử dụng trên thành phần. Chỉ những gì bạn trả về từ hàm này mới có sẵn trong `<template>` của bạn. Bạn được yêu cầu phải rõ ràng về các thuộc tính "phản ứng" khi sử dụng API này. Vue xử lý điều này cho bạn bằng cách sử dụng [Options API](https://vuejs.org/guide/extras/composition-api-faq.html#trade-offs). Điều này làm cho API mới thường được coi là trường hợp sử dụng nâng cao hơn.

Nếu bạn đang nâng cấp từ Vue 2, bạn nên xem xét [hướng dẫn di chuyển Vue 3](https://v3-migration.vuejs.org/).

{{PreviousMenu("Learn_web_development/Core/Frameworks_libraries/Vue_refs_focus_management", "Learn_web_development/Core/Frameworks_libraries")}}
