---
title: Bắt đầu với Ember
slug: Learn_web_development/Core/Frameworks_libraries/Ember_getting_started
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Ember_structure_componentization", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài viết Ember đầu tiên của chúng ta, chúng ta sẽ xem xét cách Ember hoạt động và nó hữu ích cho điều gì, cài đặt chuỗi công cụ Ember cục bộ, tạo ứng dụng mẫu, và sau đó thực hiện một số thiết lập ban đầu để chuẩn bị cho việc phát triển.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Tối thiểu, nên quen thuộc với các ngôn ngữ cốt lõi
          <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
          <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>, và
          có kiến thức về
          <a
            href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/command line</a
          >.
        </p>
        <p>
          Hiểu sâu hơn về các tính năng JavaScript hiện đại (chẳng hạn như class,
          mô-đun, v.v.), sẽ rất có lợi, vì Ember sử dụng nhiều chúng.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Tìm hiểu cách cài đặt Ember và tạo ứng dụng khởi đầu.</td>
    </tr>
  </tbody>
</table>

## Giới thiệu về Ember

Ember là một framework component-service tập trung vào trải nghiệm phát triển ứng dụng web tổng thể, giảm thiểu sự khác biệt tầm thường giữa các ứng dụng — trong khi vẫn là một lớp hiện đại và nhẹ trên JavaScript gốc. Ember cũng có khả năng tương thích ngược và xuôi rất lớn để giúp các doanh nghiệp cập nhật với các phiên bản Ember mới nhất và các quy ước do cộng đồng thúc đẩy mới nhất.

Ý nghĩa của framework component-service là gì? Các thành phần là các gói hành vi, kiểu dáng và đánh dấu riêng lẻ — giống như những gì các framework frontend khác cung cấp, chẳng hạn như React, Vue và Angular. Phần dịch vụ cung cấp trạng thái chia sẻ tồn tại lâu dài, hành vi và giao diện để tích hợp với các thư viện hoặc hệ thống khác. Ví dụ, Router (sẽ được đề cập sau trong hướng dẫn này) là một dịch vụ. Các thành phần và Dịch vụ tạo nên phần lớn bất kỳ ứng dụng EmberJS nào.

## Các trường hợp sử dụng

Nhìn chung, EmberJS hoạt động tốt để xây dựng các ứng dụng mong muốn một hoặc cả hai đặc điểm sau:

- Ứng dụng Đơn Trang, bao gồm các ứng dụng web giống native, và [ứng dụng web tiến bộ](/en-US/docs/Web/Progressive_web_apps) (PWA)
  - Ember hoạt động tốt nhất khi nó là toàn bộ frontend của ứng dụng.

- Tăng sự kết hợp giữa các công nghệ stack của nhiều nhóm
  - "Thực hành tốt nhất" được cộng đồng hỗ trợ cho phép tốc độ phát triển dài hạn nhanh hơn.
  - Ember có các quy ước rõ ràng hữu ích để thực thi tính nhất quán và giúp các thành viên nhóm nắm bắt nhanh chóng.

### Ember với add-on

EmberJS có kiến trúc plugin, có nghĩa là các add-on có thể được cài đặt và cung cấp chức năng bổ sung với rất ít hoặc không có cấu hình.

Ví dụ bao gồm:

- [PREmber](https://github.com/ef4/prember): Render trang web tĩnh cho blog hoặc nội dung tiếp thị.
- [empress-blog](https://empress-blog.netlify.app/welcome/): Viết bài blog bằng markdown trong khi tối ưu hóa cho SEO với PREmber.
- [ember-service-worker](https://ember-service-worker.com/): Cấu hình PWA để ứng dụng có thể được cài đặt trên thiết bị di động, giống như các ứng dụng từ cửa hàng ứng dụng tương ứng của thiết bị.

## Quan điểm

EmberJS là một trong những framework frontend có quan điểm mạnh mẽ nhất hiện có. Nhưng ý nghĩa của việc có quan điểm là gì? Trong Ember, quan điểm là tập hợp các quy ước giúp tăng hiệu quả của nhà phát triển với cái giá phải học những quy ước đó. Khi các quy ước được định nghĩa và chia sẻ, các quan điểm hỗ trợ những quy ước đó giúp giảm sự khác biệt tầm thường giữa các ứng dụng — một mục tiêu chung trong tất cả các framework có quan điểm, trên bất kỳ ngôn ngữ và hệ sinh thái nào. Nhà phát triển sau đó có thể dễ dàng chuyển đổi giữa các dự án và ứng dụng mà không phải học lại hoàn toàn kiến trúc, mẫu, quy ước, v.v.

Khi bạn làm việc qua loạt bài hướng dẫn này, bạn sẽ nhận thấy quan điểm của Ember — chẳng hạn như các quy ước đặt tên nghiêm ngặt của các file thành phần.

## Ember liên quan đến JavaScript thuần như thế nào?

Ember được xây dựng trên công nghệ JavaScript và là một lớp mỏng trên [lập trình hướng đối tượng](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object-oriented_programming) truyền thống, trong khi vẫn cho phép nhà phát triển sử dụng [kỹ thuật lập trình hàm](https://opensource.com/article/17/6/functional-javascript).

Ember sử dụng hai cú pháp chính:

- JavaScript (hoặc tùy chọn, [TypeScript](https://www.typescriptlang.org/))
- Ngôn ngữ mẫu riêng của Ember, được dựa lỏng lẻo trên [Handlebars](https://handlebarsjs.com/guide/).

Ngôn ngữ mẫu được sử dụng để thực hiện các tối ưu hóa thời gian biên dịch và chạy mà không thể thực hiện được theo cách khác. Quan trọng nhất, nó là tập hợp cha của HTML — nghĩa là bất kỳ ai biết HTML đều có thể đóng góp có ý nghĩa cho bất kỳ dự án Ember nào với nỗi sợ tối thiểu về việc làm hỏng code. Nhà thiết kế và những người không phải nhà phát triển khác có thể đóng góp vào các mẫu trang mà không cần biết JavaScript, và tính tương tác có thể được thêm vào sau.

Ngôn ngữ này cũng cho phép các payload tài sản nhẹ hơn do _biên dịch_ các mẫu thành "byte code" có thể được phân tích nhanh hơn JavaScript. **Glimmer VM** cho phép theo dõi thay đổi DOM cực kỳ nhanh mà không cần quản lý và diff một biểu diễn ảo được cache (đây là một cách tiếp cận phổ biến để giảm thiểu I/O DOM chậm).

Để biết thêm thông tin về các khía cạnh kỹ thuật của Glimmer VM, kho lưu trữ GitHub có một số [tài liệu](https://github.com/glimmerjs/glimmer-vm/tree/main/guides) — cụ thể, [References](https://github.com/glimmerjs/glimmer-vm/blob/main/guides/04-references.md) và [Validators](https://github.com/glimmerjs/glimmer-vm/blob/main/guides/05-validators.md) có thể rất thú vị.

Mọi thứ khác trong Ember là _chỉ_ JavaScript. Đặc biệt, các lớp class JavaScript. Đây là nơi hầu hết các phần "framework" xuất hiện, vì có [superclass](<https://en.wikipedia.org/wiki/Inheritance_(object-oriented_programming)#Subclasses_and_superclasses>), nơi mỗi loại _thứ_ có một mục đích khác nhau và vị trí dự kiến khác nhau trong dự án của bạn.

Dưới đây là minh họa tác động của Ember đối với JavaScript trong các dự án điển hình:
[Gavin minh họa cách < 20% JS được viết là dành riêng cho Ember](https://x.com/gavinjoyce/status/1174726713101705216).

![a set of code files with the ember-specific JavaScript highlighted, showing that only 20% of the Ember code is Ember-specific](20percent-js-specific-ember.png)

## Bắt đầu

Phần còn lại của tài liệu Ember bạn sẽ tìm thấy ở đây bao gồm một hướng dẫn nhiều phần, trong đó chúng ta sẽ tạo một phiên bản của ứng dụng mẫu [TodoMVC](https://todomvc.com/) kinh điển, dạy bạn cách sử dụng các yếu tố thiết yếu của framework Ember trong quá trình đó. TodoMVC là ứng dụng theo dõi việc cần làm cơ bản được triển khai trong nhiều công nghệ khác nhau.

[Đây là phiên bản Ember đã hoàn thiện](https://nullvoxpopuli.github.io/ember-todomvc-tutorial/), để tham khảo.

### Lưu ý về TodoMVC và khả năng tiếp cận

Dự án TodoMVC có một vài vấn đề về việc tuân thủ các thực hành web có thể tiếp cận/mặc định. Có một vài issue GitHub mở về điều này trong gia đình dự án TodoMVC:

- [Thêm quyền truy cập bàn phím vào các demo](https://github.com/tastejs/todomvc/issues/1017)
- [Bật lại Outline trên các phần tử có thể focus](https://github.com/tastejs/todomvc-app-css/issues/35)

Ember cam kết mạnh mẽ với khả năng tiếp cận theo mặc định và có một [phần toàn bộ trong Hướng dẫn Ember về khả năng tiếp cận](https://guides.emberjs.com/release/accessibility/) về ý nghĩa của thiết kế trang web/ứng dụng.

Tuy nhiên, vì hướng dẫn này tập trung vào phía JavaScript khi tạo ứng dụng web nhỏ, giá trị của TodoMVC đến từ việc cung cấp CSS làm sẵn và cấu trúc HTML được đề xuất, giúp loại bỏ các sự khác biệt nhỏ giữa các triển khai, cho phép so sánh dễ dàng hơn. Sau trong hướng dẫn, chúng ta sẽ tập trung vào việc thêm code vào ứng dụng để sửa một số lỗi lớn nhất của TodoMVC.

## Cài đặt công cụ Ember

Ember sử dụng công cụ giao diện dòng lệnh (CLI) để xây dựng và tạo khung cho các phần của ứng dụng.

1. Bạn sẽ cần node và npm được cài đặt trước khi cài đặt ember-cli. [Xem tại đây để tìm hiểu cách cài đặt node và npm](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line#adding_powerups), nếu bạn chưa có.
2. Bây giờ hãy gõ lệnh sau vào terminal để cài đặt ember-cli:

   ```bash
   npm install -g ember-cli
   ```

   Công cụ này cung cấp chương trình `ember` trong terminal, được sử dụng để tạo, xây dựng, phát triển, kiểm thử và tạo khung ứng dụng (chạy `ember --help` để xem danh sách đầy đủ các lệnh và tùy chọn của chúng).

3. Để tạo một ứng dụng mới hoàn toàn, hãy gõ lệnh sau vào terminal. Lệnh này tạo một thư mục mới bên trong thư mục hiện tại bạn đang ở gọi là todomvc, chứa khung cho ứng dụng Ember mới. Hãy đảm bảo bạn điều hướng đến nơi thích hợp trong terminal trước khi chạy nó. (Gợi ý tốt là thư mục "desktop" hoặc "documents" của bạn, để dễ tìm):

   ```bash
   ember new todomvc
   ```

   Hoặc, trên Windows:

   ```bash
   npx ember-cli new todomvc
   ```

Điều này tạo ra một môi trường phát triển ứng dụng sẵn sàng cho sản xuất bao gồm các tính năng sau theo mặc định:

- Máy chủ phát triển với live reload.
- Kiến trúc plugin cho phép các gói của bên thứ ba tăng cường phong phú cho ứng dụng của bạn.
- JavaScript mới nhất thông qua tích hợp Babel và webpack.
- Môi trường kiểm thử tự động chạy các kiểm thử trong trình duyệt, cho phép bạn _kiểm thử như người dùng_.
- Biên dịch và thu nhỏ, cả CSS và JavaScript cho các bản build sản xuất.
- Các quy ước để giảm thiểu sự khác biệt giữa các ứng dụng (cho phép chuyển đổi ngữ cảnh tư duy dễ dàng hơn).

## Chuẩn bị xây dựng dự án Ember của chúng ta

Bạn sẽ cần trình soạn thảo code trước khi tiếp tục tương tác với dự án mới của mình. Nếu bạn chưa cấu hình một, [The Ember Atlas](https://www.notion.so/Editors-Tooling-5da96f0b2baf4ce1bf3fd58e3b60c7f6) có một số hướng dẫn về cách thiết lập các trình soạn thảo khác nhau.

### Cài đặt các tài sản chia sẻ cho các dự án TodoMVC

Cài đặt các tài sản chia sẻ, như chúng ta sắp làm, không thường là bước bắt buộc cho các dự án mới, nhưng nó cho phép chúng ta sử dụng CSS chia sẻ hiện có để chúng ta không cần cố gắng đoán CSS cần thiết để tạo kiểu dáng TodoMVC.

1. Đầu tiên, hãy vào thư mục `todomvc` trong terminal, ví dụ sử dụng `cd todomvc` trên macOS/Linux.
2. Bây giờ hãy chạy lệnh sau để đặt CSS todomvc chung vào ứng dụng của bạn:

   ```bash
   npm install --save-dev todomvc-app-css todomvc-common
   ```

3. Tiếp theo, tìm file [ember-cli-build.js](https://github.com/ember-cli/ember-cli/blob/master/packages/app-blueprint/files/ember-cli-build.js) bên trong thư mục todomvc (ngay bên trong thư mục gốc) và mở nó trong trình soạn thảo code bạn chọn. ember-cli-build.js chịu trách nhiệm cấu hình chi tiết về cách xây dựng dự án — bao gồm gộp tất cả các file của bạn lại, thu nhỏ tài sản và tạo sourcemap — với các mặc định hợp lý, vì vậy bạn thường không cần lo lắng về file này.

   Tuy nhiên, chúng ta sẽ thêm các dòng vào file ember-cli-build.js để import các file CSS chia sẻ, để chúng trở thành một phần của bản build mà không cần phải {{cssxref("@import")}} chúng một cách tường minh vào file `app.css` (điều này sẽ yêu cầu viết lại URL tại thời điểm build và do đó kém hiệu quả hơn và phức tạp hơn để thiết lập).

4. Trong `ember-cli-build.js`, tìm code sau:

   ```js
   let app = new EmberApp(defaults, {
     // Add options here
   });
   ```

5. Thêm các dòng sau bên dưới nó trước khi lưu file:

   ```js
   app.import("node_modules/todomvc-common/base.css");
   app.import("node_modules/todomvc-app-css/index.css");
   ```

   Để biết thêm thông tin về những gì `ember-cli-build.js` làm, và các cách khác mà bạn có thể tùy chỉnh bản build / pipeline của mình, Hướng dẫn Ember có trang về [Addons và Dependencies](https://guides.emberjs.com/release/addons-and-dependencies/).

6. Cuối cùng, tìm `app.css`, nằm tại `app/styles/app.css`, và dán vào:

   ```css
   :focus,
   .view label:focus,
   .todo-list li .toggle:focus + label,
   .toggle-all:focus + label {
     /* !important needed because todomvc styles deliberately disable the outline */
     outline: #d86f95 solid !important;
   }
   ```

CSS này ghi đè một số kiểu dáng được cung cấp bởi gói npm `todomvc-app-css`, do đó cho phép focus bàn phím hiển thị. Điều này góp phần sửa một trong những nhược điểm khả năng tiếp cận lớn của ứng dụng TodoMVC mặc định.

### Khởi động máy chủ phát triển

Bạn có thể khởi động ứng dụng ở chế độ _phát triển_ bằng cách gõ lệnh sau vào terminal, trong khi ở bên trong thư mục `todomvc`:

```bash
ember server
```

Điều này sẽ cho bạn đầu ra tương tự như sau:

```plain
Build successful (190ms) – Serving on http://localhost:4200/

Slowest Nodes (totalTime >= 5%)          | Total (avg)
-----------------------------------------+-----------
BroccoliMergeTrees (17)                  | 35ms (2 ms)
Package /assets/vendor.js (1)            | 13ms
Concat: Vendor Styles/assets/vend... (1) | 12ms
```

Máy chủ phát triển khởi động tại `http://localhost:4200`, mà bạn có thể truy cập trong trình duyệt để kiểm tra công việc của mình trông như thế nào cho đến nay.

Nếu mọi thứ hoạt động đúng, bạn sẽ thấy một trang như thế này:

![The default start page when you create a new Ember app, with a cartoon mascot, saying congratulations](ember-start-page.png)

> [!NOTE]
> Trên hệ thống Windows không có [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install), bạn sẽ gặp thời gian build chậm hơn so với macOS, Linux và Windows _với_ WSL.

## Tóm tắt

Cho đến nay khá tốt. Chúng ta đã đến điểm có thể bắt đầu xây dựng ứng dụng TodoMVC mẫu trong Ember. Trong bài viết tiếp theo, chúng ta sẽ xem xét việc xây dựng cấu trúc đánh dấu của ứng dụng, như một nhóm các thành phần logic.

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Ember_structure_componentization", "Learn_web_development/Core/Frameworks_libraries")}}
