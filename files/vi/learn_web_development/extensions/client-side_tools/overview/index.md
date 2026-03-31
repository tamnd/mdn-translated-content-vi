---
title: Tổng quan về công cụ phía máy khách
short-title: Tổng quan
slug: Learn_web_development/Extensions/Client-side_tools/Overview
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Client-side_tools/Package_management", "Learn_web_development/Extensions/Client-side_tools")}}

Trong bài viết này, chúng ta cung cấp tổng quan về công cụ web hiện đại, các loại công cụ nào có sẵn và bạn sẽ gặp chúng ở đâu trong vòng đời phát triển ứng dụng web, và cách tìm trợ giúp với các công cụ riêng lẻ.

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
        Hiểu các loại công cụ phía máy khách nào tồn tại, và cách
        tìm công cụ và nhận trợ giúp với chúng.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan về công cụ hiện đại

Viết phần mềm cho web ngày càng trở nên tinh vi hơn qua các thời đại. Mặc dù vẫn hoàn toàn hợp lý để viết HTML, CSS và JavaScript "bằng tay", nhưng giờ đây có nhiều công cụ mà các nhà phát triển có thể sử dụng để tăng tốc quá trình xây dựng trang web hoặc ứng dụng.

Có một số công cụ được thiết lập tốt đã trở thành "tên quen thuộc" trong cộng đồng phát triển, và các công cụ mới đang được viết và phát hành hàng ngày để giải quyết các vấn đề cụ thể. Bạn thậm chí có thể thấy mình viết một phần mềm để hỗ trợ quá trình phát triển của riêng bạn, để giải quyết một vấn đề cụ thể mà các công cụ hiện có dường như chưa xử lý.

Dễ dàng bị choáng ngợp bởi số lượng lớn các công cụ có thể được đưa vào một dự án. Tương tự, một tệp cấu hình duy nhất cho công cụ như [webpack](https://webpack.js.org/) có thể dài hàng trăm dòng, hầu hết là các phép thuật thần kỳ có vẻ như làm được việc nhưng chỉ có kỹ sư cao cấp mới hiểu đầy đủ!

Theo thời gian, ngay cả những nhà phát triển web có kinh nghiệm nhất cũng gặp khó khăn với vấn đề công cụ; có thể lãng phí nhiều giờ để cố gắng làm cho một đường dẫn công cụ hoạt động trước khi chạm vào một dòng mã ứng dụng. Nếu bạn thấy mình đang vật lộn trong quá khứ, thì đừng lo — bạn không phải là người duy nhất.

Trong các bài viết này, chúng ta sẽ không trả lời mọi câu hỏi về công cụ web, nhưng chúng ta sẽ cung cấp cho bạn điểm khởi đầu hữu ích để hiểu các nguyên tắc cơ bản, từ đó bạn có thể xây dựng. Như với bất kỳ chủ đề phức tạp nào, tốt nhất là bắt đầu nhỏ và dần dần làm việc theo cách của bạn lên đến các cách sử dụng nâng cao hơn.

## Hệ sinh thái công cụ hiện đại

Hệ sinh thái công cụ nhà phát triển hiện đại ngày nay rất lớn, vì vậy sẽ hữu ích khi có ý tưởng rộng về những vấn đề chính mà các công cụ đang giải quyết. Nếu bạn nhảy vào công cụ tìm kiếm yêu thích của mình và tìm kiếm "front-end developer tools", bạn sẽ gặp một phổ rộng lớn các kết quả từ trình soạn thảo văn bản đến trình duyệt đến loại bút bạn có thể sử dụng để ghi chú.

Mặc dù lựa chọn trình soạn thảo mã của bạn chắc chắn là một lựa chọn công cụ, loạt bài viết này sẽ đi xa hơn điều đó, tập trung vào các công cụ nhà phát triển giúp bạn tạo ra mã web hiệu quả hơn. Chúng ta sẽ khuyến nghị một số công cụ cụ thể và các hướng dẫn sau sẽ hướng dẫn bạn cách sử dụng chúng.

Từ góc độ cao, bạn có thể đặt các công cụ phía máy khách vào bốn danh mục rộng sau đây về các vấn đề cần giải quyết:

- **Môi trường** — Công cụ giúp bạn thiết lập môi trường phát triển, chẳng hạn như cài đặt và chạy các công cụ khác.
- **Lưới an toàn** — Công cụ hữu ích trong quá trình phát triển mã của bạn.
- **Chuyển đổi** — Công cụ chuyển đổi mã theo một cách nào đó, ví dụ: chuyển ngôn ngữ trung gian thành JavaScript mà trình duyệt có thể hiểu.
- **Sau phát triển** — Công cụ hữu ích sau khi bạn đã viết mã, chẳng hạn như công cụ kiểm thử và triển khai.

Hãy xem xét từng loại trong số này chi tiết hơn.

### Môi trường

Trình soạn thảo, hệ điều hành và trình duyệt đều là môi trường phát triển. Chúng ta sẽ giả định rằng bạn đã quyết định với lựa chọn bạn cảm thấy thoải mái nhất. Tuy nhiên, trước khi cài đặt và chạy các công cụ khác, vẫn còn hai lựa chọn cần thực hiện:

- Nơi bạn sẽ chạy các công cụ. Hầu hết các công cụ chạy cục bộ đều được viết bằng JavaScript, vì vậy bạn cần một trình thông dịch JavaScript trên máy tính của mình có thể được gọi từ dòng lệnh. [Node.js](https://nodejs.org/) vẫn là tiêu chuẩn ngành và chúng ta sẽ sử dụng nó. [Bun](https://bun.com/) được thiết kế để thay thế Node.js, được biết đến với tốc độ và API mạnh mẽ.
- Cách bạn sẽ cài đặt các công cụ, nói cách khác là _trình quản lý gói_. Node cung cấp [npm](https://www.npmjs.com/) theo mặc định, vì vậy chúng ta sẽ sử dụng nó. [Yarn](https://yarnpkg.com/) và [pnpm](https://pnpm.io/) là các lựa chọn phổ biến khác.

### Lưới an toàn

Đây là các công cụ làm cho mã bạn viết tốt hơn một chút.

#### Trình kiểm tra mã (Linters)

**Trình kiểm tra mã** là các công cụ kiểm tra qua mã của bạn và cho bạn biết về bất kỳ lỗi nào hiện có, loại lỗi là gì, và chúng ở dòng mã nào. Thường thì trình kiểm tra mã có thể được cấu hình không chỉ để báo cáo lỗi mà còn báo cáo bất kỳ vi phạm nào của hướng dẫn kiểu cụ thể mà nhóm của bạn có thể đang sử dụng.

[ESLint](https://eslint.org/) là trình kiểm tra mã JavaScript tiêu chuẩn ngành — một công cụ có thể cấu hình cao để phát hiện các lỗi cú pháp tiềm ẩn và khuyến khích "thực hành tốt nhất" trong mã của bạn.

#### Kiểm soát mã nguồn

Còn được gọi là **hệ thống kiểm soát phiên bản** (VCS), **kiểm soát mã nguồn** là điều cần thiết để sao lưu công việc và làm việc trong nhóm. Một VCS điển hình liên quan đến việc có phiên bản cục bộ của mã mà bạn thực hiện thay đổi. Sau đó bạn "đẩy" các thay đổi vào phiên bản "chính" của mã trong kho lưu trữ từ xa được lưu trữ trên máy chủ nào đó.

[Git](https://git-scm.com/) là hệ thống kiểm soát mã nguồn mà hầu hết mọi người sử dụng hiện nay. Nó chủ yếu được truy cập qua dòng lệnh nhưng có thể được truy cập qua giao diện người dùng thân thiện.

#### Trình định dạng mã

Trình định dạng mã có phần liên quan đến trình kiểm tra mã, ngoại trừ thay vì chỉ ra lỗi trong mã của bạn, chúng thường có xu hướng đảm bảo mã của bạn được định dạng đúng cách, theo các quy tắc kiểu của bạn, tự động sửa các lỗi tìm thấy.

[Prettier](https://prettier.io/) là một ví dụ rất phổ biến về trình định dạng mã.

#### Trình kiểm tra kiểu dữ liệu

Trình kiểm tra kiểu dữ liệu giúp bạn viết mã đáng tin cậy hơn bằng cách kiểm tra xem mã của bạn có sử dụng đúng loại dữ liệu ở đúng nơi không.

[TypeScript](https://www.typescriptlang.org/) là trình kiểm tra kiểu dữ liệu thực tế cho JavaScript.

### Chuyển đổi

Giai đoạn này của vòng đời ứng dụng web của bạn thường cho phép bạn viết mã bằng "mã tương lai" (chẳng hạn như các tính năng CSS hoặc JavaScript mới nhất có thể chưa được hỗ trợ gốc trong trình duyệt) hoặc sử dụng ngôn ngữ khác hoàn toàn, chẳng hạn như TypeScript. Các công cụ chuyển đổi sẽ tạo mã tương thích trình duyệt cho bạn, để sử dụng trong sản xuất.

Chuyển đổi mang lại ba lợi ích chính:

1. Khả năng viết mã sử dụng các tính năng ngôn ngữ mới nhất và chuyển đổi đó thành mã hoạt động trên các thiết bị hàng ngày. Ví dụ tốt bao gồm:
   - [Babel](https://babeljs.io/): Trình biên dịch JavaScript cho phép các nhà phát triển viết mã bằng JavaScript tiên tiến.
   - [PostCSS](https://postcss.org/): Làm điều tương tự như Babel, nhưng cho các tính năng CSS tiên tiến.

2. Tùy chọn để viết mã bằng ngôn ngữ hoàn toàn khác và chuyển đổi sang ngôn ngữ tương thích web. Ví dụ:
   - [Sass/SCSS](https://sass-lang.com/): Phần mở rộng CSS này cho phép bạn sử dụng biến, quy tắc lồng, mixin, hàm và nhiều tính năng khác.
   - [TypeScript](https://www.typescriptlang.org/): Siêu tập hợp của JavaScript cung cấp nhiều tính năng bổ sung.
   - Các khung như [React](https://react.dev/), [Ember](https://emberjs.com/), và [Vue](https://vuejs.org/).

3. Tối ưu hóa. Điều này được cung cấp bởi _các trình đóng gói_, là các công cụ chuẩn bị mã của bạn cho sản xuất, ví dụ bằng "tree-shaking" để đảm bảo chỉ các phần của thư viện mã bạn thực sự sử dụng mới được đưa vào mã sản xuất cuối cùng, hoặc "minifying" để xóa tất cả khoảng trắng trong mã sản xuất, làm cho nó nhỏ nhất có thể trước khi được tải lên máy chủ. Ví dụ:
   - [Webpack](https://webpack.js.org/) đã là trình đóng gói phổ biến nhất trong một thời gian dài.
   - [Vite](https://vite.dev/) là công cụ xây dựng hiện đại hơn, nổi tiếng về tốc độ, đơn giản và sự phong phú của các tính năng.

### Sau phát triển

Công cụ sau phát triển đảm bảo phần mềm của bạn đến được web và tiếp tục chạy. Điều này bao gồm các quy trình triển khai, khung kiểm thử, công cụ kiểm tra và nhiều hơn nữa.

Giai đoạn này của quá trình phát triển là giai đoạn bạn muốn ít tương tác tích cực nhất để khi nó được cấu hình, nó chạy chủ yếu tự động.

#### Công cụ kiểm thử

Chúng thường có dạng công cụ tự động chạy kiểm thử với mã của bạn để đảm bảo nó đúng trước khi bạn tiến thêm. Các khung để viết kiểm thử bao gồm [Jest](https://jestjs.io/), [Mocha](https://mochajs.org/) và [Jasmine](https://jasmine.github.io/).

#### Công cụ triển khai

Hệ thống triển khai cho phép bạn xuất bản trang web của mình. [GitHub Pages](https://pages.github.com/) được tích hợp tốt với GitHub và miễn phí cho tất cả các kho công khai. Các dịch vụ khác như [Netlify](https://www.netlify.com/) và [Vercel](https://vercel.com/) cũng rất phổ biến.

## Cách chọn và nhận trợ giúp với một công cụ cụ thể

Hầu hết các công cụ có xu hướng được viết và phát hành riêng lẻ, vì vậy mặc dù có trợ giúp nhưng không bao giờ ở cùng một nơi hay định dạng. Do đó có thể khó tìm trợ giúp sử dụng một công cụ.

Bạn có thể sẽ cần kết hợp những điều sau:

- Giáo viên, cố vấn, sinh viên đồng môn hoặc đồng nghiệp có kinh nghiệm.
- Nơi cụ thể hữu ích để tìm kiếm. Tìm kiếm web chung về công cụ nhà phát triển front-end thường vô ích trừ khi bạn đã biết tên của công cụ bạn đang tìm kiếm.
- Diễn đàn liên quan đến phát triển để hỏi về những công cụ nào cần sử dụng, ví dụ như [MDN Learn Discourse](https://discourse.mozilla.org/c/mdn/learn/250), hoặc [Stack Overflow](https://stackoverflow.com/).

## Tóm tắt

Điều đó kết thúc phần giới thiệu nhẹ nhàng của chúng ta về chủ đề công cụ web phía máy khách. Tiếp theo, chúng ta sẽ xem xét các trình quản lý gói.

{{NextMenu("Learn_web_development/Extensions/Client-side_tools/Package_management", "Learn_web_development/Extensions/Client-side_tools")}}
