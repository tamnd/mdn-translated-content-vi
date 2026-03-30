---
title: Triển khai ứng dụng của chúng ta
slug: Learn_web_development/Extensions/Client-side_tools/Deployment
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Extensions/Client-side_tools/Introducing_complete_toolchain", "Learn_web_development/Extensions/Client-side_tools")}}

Trong bài viết cuối cùng trong loạt bài, chúng ta lấy chuỗi công cụ mẫu mà chúng ta đã xây dựng trong bài viết trước và thêm vào đó để chúng ta có thể triển khai ứng dụng mẫu. Chúng ta đẩy mã lên GitHub, triển khai bằng GitHub Pages, và thậm chí cho bạn thấy cách thêm một bài kiểm tra đơn giản vào quá trình.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hoàn thành việc làm qua nghiên cứu trường hợp chuỗi công cụ hoàn chỉnh, tập trung vào
        việc triển khai ứng dụng.
      </td>
    </tr>
  </tbody>
</table>

## Sau phát triển

Có thể có nhiều vấn đề cần giải quyết trong phần này của vòng đời dự án. Do đó, điều quan trọng là tạo một chuỗi công cụ xử lý các vấn đề này theo cách yêu cầu can thiệp thủ công ít nhất có thể.

Đây chỉ là một vài điều cần xem xét cho dự án cụ thể này:

- Tạo bản dựng sản xuất: Đảm bảo các tệp được thu nhỏ, phân đoạn, có áp dụng tree-shaking, và các phiên bản được "xóa cache".
- Chạy kiểm thử: Chúng có thể dao động từ "mã này có được định dạng đúng không?" đến "điều này có hoạt động như tôi mong đợi không?", và đảm bảo các bài kiểm thử thất bại ngăn triển khai.
- Thực sự triển khai mã đã cập nhật lên URL trực tiếp: Hoặc có thể là URL staging để nó có thể được xem xét trước.

> [!NOTE]
> Cache busting là một thuật ngữ mới mà chúng ta chưa gặp trước đây trong mô-đun. Đây là chiến lược phá vỡ cơ chế lưu cache của trình duyệt, buộc trình duyệt tải xuống bản sao mới mã của bạn. Vite (và thực sự nhiều công cụ khác) sẽ tạo tên tệp duy nhất cho mỗi lần xây dựng mới. Tên tệp duy nhất này "phá vỡ" cache của trình duyệt, đảm bảo trình duyệt tải xuống mã mới mỗi khi cập nhật được thực hiện đối với mã được triển khai.

Các tác vụ trên cũng phân tách thành các tác vụ tiếp theo; lưu ý rằng hầu hết các nhóm phát triển web sẽ có các thuật ngữ và quy trình riêng cho ít nhất một phần của giai đoạn sau phát triển.

Đối với dự án này, chúng ta sẽ sử dụng dịch vụ lưu trữ tĩnh miễn phí của [GitHub Pages](https://pages.github.com/) để lưu trữ dự án. Nó không chỉ phục vụ trang web của chúng ta trên Internet mà còn cung cấp cho chúng ta URL của trang web.

GitHub cung cấp quy trình làm việc mượt mà để chuyển mã mới thành trang web trực tiếp:

- Bạn đẩy mã lên GitHub.
- Bạn định nghĩa một [GitHub Action](https://docs.github.com/en/actions) được kích hoạt khi có lần đẩy mới vào nhánh chính, nhánh này xây dựng mã và đặt nó ở vị trí cụ thể.
- GitHub Pages sau đó phục vụ mã tại URL cụ thể.

## Quá trình xây dựng

Vì chúng ta đang sử dụng Vite cho phát triển, tùy chọn xây dựng rất đơn giản để thêm. Như chúng ta đã thấy trước đó, chúng ta đã có tập lệnh tùy chỉnh `npm run build` sẽ cho Vite xây dựng mọi thứ sẵn sàng cho sản xuất thay vì chỉ chạy nó cho mục đích phát triển và kiểm thử.

Đây là thực hành tốt nhất để luôn định nghĩa tập lệnh `build` trong dự án của bạn, để chúng ta sau đó có thể dựa vào `npm run build` để luôn thực hiện bước xây dựng hoàn chỉnh, mà không cần nhớ các đối số lệnh xây dựng cụ thể cho mỗi dự án.

Mã sản xuất mới được tạo ra được đặt trong thư mục mới gọi là `dist`, chứa _tất cả_ các tệp cần thiết để chạy trang web, sẵn sàng để bạn tải lên máy chủ.

## Commit thay đổi lên GitHub

Phần này sẽ đưa bạn qua đường để lưu trữ mã trong kho git.

Chúng ta đã khởi tạo thư mục làm việc như thư mục git. Để xác minh nhanh điều này, chạy lệnh sau:

```bash
git status
```

Bây giờ chúng ta có ba nhiệm vụ:

1. Thêm bất kỳ thay đổi nào chúng ta đã thực hiện vào stage:

   ```bash
   git add .
   ```

2. Commit thay đổi vào kho:

   ```bash
   git commit -m 'committing initial code'
   ```

3. Cuối cùng, mã cần được đẩy lên kho GitHub của bạn. Truy cập <https://github.com/new> và tạo kho của riêng bạn để lưu trữ mã này.

   Sau đó thêm remote và đẩy:

   ```bash
   git remote add origin https://github.com/your-name/repo-name.git
   git push origin main
   ```

## Sử dụng GitHub Actions để triển khai

GitHub Actions, giống như cấu hình ESLint, là một "hố thỏ" sâu khác để lặn vào. Đối với các tác vụ phổ biến như "xây dựng trang web tĩnh và triển khai lên GitHub Pages", có nhiều ví dụ để sao chép và dán. Bạn có thể làm theo hướng dẫn trong [Publishing with a custom GitHub Actions workflow](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-with-a-custom-github-actions-workflow).

Sau khi bạn commit tệp này vào nhánh main, bạn sẽ thấy một dấu tick màu xanh lá bên cạnh tiêu đề commit.

Sau khi chờ vài phút nữa, bạn có thể truy cập URL GitHub Pages để xem trang web trực tiếp trên web.

## Kiểm thử

Kiểm thử là một chủ đề rộng lớn, ngay cả trong lĩnh vực phát triển front-end. Tôi sẽ chỉ cho bạn cách thêm bài kiểm thử ban đầu vào dự án và cách sử dụng bài kiểm thử để ngăn hoặc cho phép triển khai dự án.

Khi tiếp cận kiểm thử, có nhiều cách:

- Kiểm thử đầu cuối, liên quan đến việc khách truy cập nhấp vào thứ gì đó và thứ khác xảy ra.
- Kiểm thử tích hợp, về cơ bản hỏi "một khối mã có vẫn hoạt động khi được kết nối với khối khác không?"
- Kiểm thử đơn vị, nơi các phần nhỏ và cụ thể của chức năng được kiểm thử để xem liệu chúng có thực hiện những gì chúng phải làm không.
- [Và nhiều loại khác](https://en.wikipedia.org/wiki/Functional_testing). Xem thêm [mô-đun kiểm thử đa trình duyệt](/en-US/docs/Learn_web_development/Extensions/Testing) của chúng ta để biết nhiều thông tin kiểm thử hữu ích.

Đối với dự án này, chúng ta sẽ tạo một bài kiểm thử nhỏ sẽ kiểm tra xem dữ liệu GitHub API có ở định dạng đúng không. Vì chúng ta đang sử dụng Vite, Vite đã cung cấp công cụ tích hợp tốt để kiểm thử: [Vitest](https://vitest.dev/guide/).

1. Cài đặt Vitest:

   ```bash
   npm install --save-dev vitest
   ```

2. Trong package.json của bạn, tìm thành viên `scripts` và cập nhật nó để chứa các lệnh kiểm thử và xây dựng sau:

   ```json
   {
     "scripts": {
       "test": "vitest"
     }
   }
   ```

3. Bây giờ để chạy thủ công bài kiểm thử, từ dòng lệnh chúng ta có thể chạy:

   ```bash
   npm run test
   ```

4. Chúng ta vẫn cần kết nối bài kiểm thử với hành động xây dựng. Mở tệp `.github/workflows/github-pages.yml` và thêm bước sau, ngay trước bước chạy `npm run build`:

   ```yaml
   - name: Install deps
     run: npm ci

   # Thêm điều này
   - name: Run tests
     run: npm run test

   - name: Build
     run: npm run build
   ```

5. Bây giờ hãy tải lên mã mới lên GitHub:

   ```bash
   git add .
   git commit -m 'adding test'
   git push origin main
   ```

Cuối cùng, sau khi đẩy, GitHub Pages sẽ triển khai cập nhật dự án. Nhưng chỉ khi nó vượt qua bài kiểm thử đã được giới thiệu.

## Tóm tắt

Đó là tất cả cho nghiên cứu trường hợp mẫu, và cho mô-đun! Chúng ta hy vọng bạn thấy nó hữu ích.

Hãy tóm tắt tất cả các phần của chuỗi công cụ:

- Chất lượng và bảo trì mã được thực hiện bởi ESLint và Prettier. Các công cụ này được thêm như `devDependencies` vào dự án.
- Có hai tệp cấu hình mà các công cụ chất lượng mã đọc: `eslint.config.js` và `.prettierrc`.
- Trong quá trình phát triển, chúng ta tiếp tục thêm phụ thuộc bằng npm. Máy chủ phát triển Vite đang chạy trong nền để theo dõi thay đổi và tự động xây dựng nguồn của chúng ta.
- Triển khai được xử lý bằng cách đẩy thay đổi lên GitHub (trên nhánh "main"), điều này kích hoạt xây dựng và triển khai bằng GitHub Actions để xuất bản dự án.
- Chúng ta cũng có bài kiểm thử đơn giản ngăn việc xây dựng và triển khai trang web nếu nguồn cấp dữ liệu GitHub API không cung cấp cho chúng ta định dạng dữ liệu đúng.

{{PreviousMenu("Learn_web_development/Extensions/Client-side_tools/Introducing_complete_toolchain", "Learn_web_development/Extensions/Client-side_tools")}}
