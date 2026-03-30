---
title: Kiến thức cơ bản về quản lý gói
short-title: Quản lý gói
slug: Learn_web_development/Extensions/Client-side_tools/Package_management
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Client-side_tools/Overview","Learn_web_development/Extensions/Client-side_tools/Introducing_complete_toolchain", "Learn_web_development/Extensions/Client-side_tools")}}

Trong bài viết này, chúng ta sẽ xem xét các trình quản lý gói chi tiết hơn để hiểu cách chúng ta có thể sử dụng chúng trong các dự án của mình — để cài đặt các phụ thuộc công cụ dự án, cập nhật chúng, và nhiều hơn nữa.

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
        Hiểu trình quản lý gói và kho gói là gì, tại sao
        chúng cần thiết, và những điều cơ bản về cách sử dụng chúng.
      </td>
    </tr>
  </tbody>
</table>

## Phụ thuộc trong dự án của bạn

**Phụ thuộc** là một phần mềm bên thứ ba có thể đã được viết bởi người khác và lý tưởng là giải quyết một vấn đề duy nhất cho bạn. Một dự án web có thể có bất kỳ số lượng phụ thuộc nào, từ không đến nhiều, và các phụ thuộc của bạn có thể bao gồm các phụ thuộc con mà bạn không cài đặt rõ ràng — các phụ thuộc của bạn có thể có các phụ thuộc của riêng chúng.

Một ví dụ đơn giản về phụ thuộc hữu ích mà dự án của bạn có thể cần là một số mã để tính ngày tương đối dưới dạng văn bản có thể đọc được. Bạn chắc chắn có thể tự lập trình điều này, nhưng có khả năng cao là người khác đã giải quyết vấn đề này — tại sao lãng phí thời gian phát minh lại bánh xe? Hơn nữa, một phụ thuộc bên thứ ba đáng tin cậy có thể đã được kiểm thử trong nhiều tình huống khác nhau, làm cho nó mạnh mẽ và tương thích đa trình duyệt hơn giải pháp của riêng bạn.

Phụ thuộc dự án có thể là toàn bộ thư viện JavaScript hoặc khung — chẳng hạn React hoặc Vue — hoặc một tiện ích rất nhỏ như thư viện ngày có thể đọc được, hoặc có thể là công cụ dòng lệnh như Prettier hoặc ESLint.

Không có công cụ xây dựng hiện đại, các phụ thuộc như thế này có thể được bao gồm trong dự án của bạn bằng cách sử dụng phần tử [`<script>`](/en-US/docs/Web/HTML/Reference/Elements/script) đơn giản, nhưng điều này có thể không hoạt động ngay lập tức và bạn có thể sẽ cần một số công cụ hiện đại để đóng gói mã và các phụ thuộc của bạn cùng nhau khi chúng được phát hành trên web. **Bundle** là thuật ngữ thường được sử dụng để chỉ một tệp đơn lẻ trên máy chủ web của bạn chứa tất cả JavaScript cho phần mềm của bạn — thường được nén càng nhiều càng tốt để giúp giảm thời gian tải phần mềm của bạn xuống và hiển thị trong trình duyệt của khách truy cập.

Hơn nữa, điều gì sẽ xảy ra nếu bạn tìm thấy một công cụ tốt hơn mà bạn muốn sử dụng thay vì công cụ hiện tại, hoặc một phiên bản mới của phụ thuộc của bạn được phát hành mà bạn muốn cập nhật? Điều này không quá đau đớn với một vài phụ thuộc, nhưng trong các dự án lớn hơn với nhiều phụ thuộc, loại việc này có thể trở nên thực sự khó theo dõi. Sẽ hợp lý hơn khi sử dụng **trình quản lý gói** như npm, vì điều này sẽ đảm bảo mã được thêm vào và xóa đi một cách sạch sẽ, cùng với nhiều lợi thế khác.

## Trình quản lý gói là gì chính xác?

Chúng ta đã gặp [npm](https://www.npmjs.com/) rồi, nhưng lùi lại từ npm, một trình quản lý gói là một hệ thống sẽ quản lý các phụ thuộc dự án của bạn.

Trình quản lý gói sẽ cung cấp phương thức để cài đặt các phụ thuộc mới (còn được gọi là "gói"), quản lý nơi các gói được lưu trữ trên hệ thống tệp của bạn, và cung cấp khả năng cho bạn để xuất bản các gói của riêng bạn.

Về lý thuyết, bạn có thể không cần trình quản lý gói và có thể tải xuống và lưu trữ thủ công các phụ thuộc dự án của mình, nhưng trình quản lý gói sẽ xử lý liền mạch việc cài đặt và gỡ cài đặt các gói. Nếu bạn không sử dụng một cái, bạn sẽ phải tự xử lý:

- Tìm tất cả các tệp JavaScript gói chính xác.
- Kiểm tra chúng để đảm bảo chúng không có bất kỳ lỗ hổng đã biết nào.
- Tải chúng xuống và đặt chúng vào đúng vị trí trong dự án của bạn.
- Viết mã để bao gồm các gói trong ứng dụng của bạn.
- Làm điều tương tự cho tất cả các phụ thuộc con của các gói, có thể có hàng chục, thậm chí hàng trăm.
- Xóa tất cả các tệp lại nếu bạn muốn xóa các gói.

Ngoài ra, trình quản lý gói xử lý các phụ thuộc trùng lặp (điều gì đó trở nên quan trọng và phổ biến trong phát triển front-end).

## Kho gói

Để trình quản lý gói hoạt động, nó cần biết nơi cài đặt các gói, và điều này có dạng kho gói. Kho gói là nơi trung tâm nơi một gói được xuất bản và do đó có thể được cài đặt từ đó. npm, ngoài là trình quản lý gói, còn là tên của kho gói JavaScript được sử dụng phổ biến nhất. Kho npm tồn tại tại [npmjs.com](https://www.npmjs.com/).

npm không phải là lựa chọn duy nhất. Bạn có thể quản lý kho gói của riêng mình. Điều quan trọng là bạn đảm bảo bạn đã chọn kho tốt nhất cho bạn. Nhiều dự án sẽ sử dụng npm, và chúng ta sẽ sử dụng điều này trong các ví dụ xuyên suốt phần còn lại của mô-đun.

## Sử dụng hệ sinh thái gói

Hãy chạy qua một ví dụ để giúp bạn bắt đầu sử dụng trình quản lý gói và kho để cài đặt tiện ích dòng lệnh.

Chúng ta sẽ sử dụng [Vite](https://vite.dev/) để tạo trang web trống. Trong bài viết tiếp theo, chúng ta sẽ mở rộng chuỗi công cụ để bao gồm nhiều công cụ hơn và chỉ cho bạn cách triển khai trang web.

### Thiết lập ứng dụng như gói npm

Đầu tiên, hãy tạo một thư mục mới để lưu trữ ứng dụng thử nghiệm của chúng ta. Chúng ta sẽ gọi nó là `npm-experiment`, nhưng bạn có thể gọi nó bất cứ điều gì bạn muốn:

```bash
mkdir npm-experiment
cd npm-experiment
```

Tiếp theo, hãy khởi tạo ứng dụng của chúng ta như gói npm, để tạo tệp cấu hình — `package.json`:

```bash
npm init
```

### Cài đặt Vite

Sau khi thiết lập dự án, hãy cài đặt Vite, công cụ xây dựng trang web:

```bash
npm install --save-dev vite
```

### Chạy máy chủ phát triển

Vite cung cấp máy chủ phát triển cục bộ. Để khởi động nó:

```bash
npx vite
```

## Hướng dẫn tóm tắt về ứng dụng khách trình quản lý gói

Hướng dẫn này đã cài đặt gói Vite bằng npm, nhưng như đã đề cập trước đó, có một số lựa chọn thay thế. Danh sách sẽ phát triển theo thời gian, nhưng tại thời điểm viết bài, các trình quản lý gói chính sau đây có sẵn:

- npm tại [npmjs.org](https://www.npmjs.com/)
- pnpm tại [pnpm.js.org](https://pnpm.js.org/)
- Yarn tại [yarnpkg.com](https://yarnpkg.com/)

npm và pnpm tương tự từ góc độ dòng lệnh — thực ra pnpm nhằm mục đích có đầy đủ tương đương với các tùy chọn đối số mà npm cung cấp.

Yarn thường được nghĩ là nhanh hơn npm về mặt quá trình cài đặt.

### Khởi tạo dự án mới

```bash
npm init
yarn init
```

### Cài đặt phụ thuộc

```bash
npm install vite
yarn add vite
```

### Cập nhật phụ thuộc

```bash
npm update
yarn upgrade
```

### Tạo lệnh tùy chỉnh

Các trình quản lý gói cũng hỗ trợ tạo các lệnh tùy chỉnh và thực thi chúng từ dòng lệnh. Ví dụ, chúng ta có thể tạo lệnh sau:

```bash
npm run dev
# hoặc yarn run dev
```

Điều này sẽ chạy một tập lệnh tùy chỉnh để khởi động dự án của chúng ta ở "chế độ phát triển". Thực tế, chúng ta thường bao gồm điều này trong tất cả các dự án vì thiết lập phát triển cục bộ có xu hướng chạy hơi khác so với cách nó sẽ chạy trong sản xuất.

Để thêm điều này vào `package.json`, hãy tìm phần `scripts` và thêm lệnh `dev`:

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  }
}
```

## Tóm tắt

Điều này kết thúc chuyến tham quan của chúng ta về các trình quản lý gói. Bước tiếp theo của chúng ta là xây dựng chuỗi công cụ mẫu, đưa tất cả những gì chúng ta đã học vào thực hành.

## Xem thêm

- [npm scripts reference](https://docs.npmjs.com/cli/v8/using-npm/scripts/)
- [package.json reference](https://docs.npmjs.com/cli/v8/configuring-npm/package-json/)

{{PreviousMenuNext("Learn_web_development/Extensions/Client-side_tools/Overview","Learn_web_development/Extensions/Client-side_tools/Introducing_complete_toolchain", "Learn_web_development/Extensions/Client-side_tools")}}
