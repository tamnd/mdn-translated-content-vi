---
title: Bắt đầu với Angular
slug: Learn_web_development/Core/Frameworks_libraries/Angular_getting_started
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Angular_todo_list_beginning", "Learn_web_development/Core/Frameworks_libraries")}}

Đã đến lúc tìm hiểu về framework Angular của Google, một lựa chọn phổ biến khác mà bạn sẽ thường xuyên gặp. Trong bài viết này, chúng ta sẽ xem xét những gì Angular có thể cung cấp, cài đặt các điều kiện tiên quyết và thiết lập một ứng dụng mẫu, đồng thời xem xét kiến trúc cơ bản của Angular.

> [!NOTE]
> Hướng dẫn này nhắm đến [Angular phiên bản 18](https://angular.dev/overview) và được sửa đổi lần cuối vào tháng 8 năm 2024 (`Angular CLI: 18.2.1`).

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
        kiến thức về
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
          >terminal/command line</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Thiết lập môi trường phát triển Angular cục bộ, tạo ứng dụng khởi đầu,
        và hiểu những kiến thức cơ bản về cách nó hoạt động.
      </td>
    </tr>
  </tbody>
</table>

## Angular là gì?

Angular là một framework và nền tảng phát triển, được xây dựng trên [TypeScript](https://www.typescriptlang.org/). Nó được dùng để tạo các ứng dụng web đơn trang. Là một nền tảng, Angular bao gồm:

- Một framework dựa trên thành phần để xây dựng các ứng dụng web có thể mở rộng
- Một bộ sưu tập các thư viện tích hợp tốt bao gồm nhiều tính năng đa dạng, bao gồm định tuyến, quản lý biểu mẫu, giao tiếp client-server, và nhiều hơn nữa
- Một bộ công cụ dành cho nhà phát triển để giúp bạn phát triển, xây dựng, kiểm thử và cập nhật code

Khi bạn xây dựng ứng dụng với Angular, bạn đang tận dụng một nền tảng có thể mở rộng từ các dự án của một lập trình viên đơn lẻ đến các ứng dụng cấp doanh nghiệp. Angular được thiết kế để làm cho việc cập nhật trở nên dễ dàng nhất có thể, vì vậy bạn có thể tận dụng những phát triển mới nhất với ít nỗ lực nhất. Và tốt nhất là, hệ sinh thái Angular bao gồm một nhóm đa dạng hơn 1,7 triệu nhà phát triển, tác giả thư viện, và nhà sáng tạo nội dung.

Trước khi bạn bắt đầu khám phá nền tảng Angular, bạn nên biết về Angular CLI. Angular CLI là cách nhanh nhất, dễ nhất và được khuyến nghị để phát triển các ứng dụng Angular. Angular CLI giúp một số tác vụ trở nên dễ dàng. Dưới đây là một số lệnh ví dụ mà bạn sẽ thường xuyên sử dụng:

| Lệnh                                              | Mô tả                                                                             |
| ------------------------------------------------- | --------------------------------------------------------------------------------- |
| [`ng build`](https://angular.dev/cli/build)       | Biên dịch ứng dụng Angular vào thư mục đầu ra.                                    |
| [`ng serve`](https://angular.dev/cli/serve)       | Xây dựng và phục vụ ứng dụng của bạn, tự động biên dịch lại khi có thay đổi file. |
| [`ng generate`](https://angular.dev/cli/generate) | Tạo hoặc sửa đổi các file dựa trên một schematic.                                 |
| [`ng test`](https://angular.dev/cli/test)         | Chạy unit test trên một dự án nhất định.                                          |
| [`ng e2e`](https://angular.dev/cli/e2e)           | Xây dựng và phục vụ ứng dụng Angular, sau đó chạy các kiểm thử end-to-end.        |

Bạn sẽ thấy Angular CLI là một công cụ có giá trị để xây dựng các ứng dụng của mình.

## Bạn sẽ xây dựng gì?

Loạt bài hướng dẫn này hướng dẫn bạn xây dựng một ứng dụng danh sách việc cần làm. Thông qua ứng dụng này, bạn sẽ học cách sử dụng Angular để quản lý, chỉnh sửa, thêm, xóa và lọc các mục.

## Điều kiện tiên quyết

Để cài đặt Angular trên hệ thống cục bộ của bạn, bạn cần những thứ sau:

- **Node.js**

  Angular yêu cầu phiên bản [LTS hiện hành hoặc LTS bảo trì](https://nodejs.org/en/about/previous-releases) của Node.js. Để biết thông tin về các yêu cầu phiên bản cụ thể, hãy xem trang [Tương thích phiên bản](https://angular.dev/reference/versions).

  Để biết thêm thông tin về cách cài đặt Node.js, hãy xem [nodejs.org](https://nodejs.org/en/download).
  Nếu bạn không chắc phiên bản Node.js nào đang chạy trên hệ thống của mình, hãy chạy `node -v` trong cửa sổ terminal.

- **Trình quản lý gói npm**

  Angular, Angular CLI, và các ứng dụng Angular phụ thuộc vào [các gói npm](https://docs.npmjs.com/getting-started/what-is-npm/) cho nhiều tính năng và chức năng.
  Để tải xuống và cài đặt các gói npm, bạn cần một trình quản lý gói npm.
  Hướng dẫn này sử dụng giao diện dòng lệnh [npm client](https://docs.npmjs.com/cli/install/), được cài đặt cùng với `Node.js` theo mặc định.
  Để kiểm tra xem bạn đã cài đặt npm client chưa, hãy chạy `npm -v` trong cửa sổ terminal.

## Tạo ứng dụng Angular

Bạn có thể sử dụng Angular CLI để chạy các lệnh trong terminal để tạo, xây dựng, kiểm thử và triển khai các ứng dụng Angular.
Để cài đặt Angular CLI trên toàn hệ thống, hãy chạy lệnh sau trong terminal:

```bash
npm install -g @angular/cli
```

Tất cả các lệnh Angular CLI đều bắt đầu bằng `ng`, theo sau là những gì bạn muốn CLI thực hiện.
Tạo một thư mục mới nơi bạn muốn xây dựng ứng dụng, và chuyển sang thư mục đó trong terminal. Sau đó sử dụng lệnh [`ng new`](https://angular.dev/cli/new) sau để tạo một ứng dụng mới có tên `todo`:

```bash
ng new todo --routing=false --style=css --ssr=false
```

Lệnh `ng new` tạo một ứng dụng Angular khởi đầu tối giản.
Các cờ bổ sung, `--routing` và `--style`, và `--ssr` xác định cách xử lý điều hướng và kiểu dáng trong ứng dụng, và cấu hình render phía máy chủ.
Hướng dẫn này mô tả các tính năng này chi tiết hơn ở phần sau.

Lần đầu tiên bạn chạy `ng`, bạn có thể được hỏi liệu bạn có muốn bật [tự động hoàn thành](https://angular.dev/cli/completion) terminal và phân tích không.
Tự động hoàn thành rất tiện lợi vì nhấn <kbd>TAB</kbd> trong khi gõ lệnh `ng` sẽ hiển thị các tùy chọn có thể có và sẽ tự động hoàn thành các đối số.

Bạn cũng có thể quyết định liệu bạn có muốn cho phép gửi phân tích về việc sử dụng CLI đến những người duy trì Angular tại Google không.
Để tìm hiểu thêm về phân tích, hãy xem [tài liệu Angular CLI `ng analytics`](https://angular.dev/cli/analytics).

Để chạy ứng dụng `todo` của bạn, hãy điều hướng vào dự án mới của bạn bằng lệnh `cd` và chạy `ng serve`:

```bash
cd todo
ng serve
```

Trong trình duyệt, hãy điều hướng đến `http://localhost:4200/` để xem ứng dụng khởi đầu mới của bạn.
Nếu bạn thay đổi bất kỳ file nguồn nào, ứng dụng sẽ tự động tải lại.

Khi `ng serve` đang chạy, hãy mở tab terminal thứ hai hoặc cửa sổ terminal để chạy các lệnh mà không dừng máy chủ.
Nếu bất cứ lúc nào bạn muốn dừng phục vụ ứng dụng, hãy nhấn `Ctrl+c` trong terminal đang chạy lệnh `ng serve`.

## Làm quen với ứng dụng Angular của bạn

Các file nguồn ứng dụng mà hướng dẫn này tập trung vào nằm trong `src/app`:

```plain
src/app
├── app.component.css
├── app.component.html
├── app.component.spec.ts
├── app.component.ts
└── app.config.ts
```

Các file quan trọng mà CLI tự động tạo ra như sau:

1. `app.component.ts`: Còn được gọi là lớp class, chứa logic cho trang chính của ứng dụng.
2. `app.component.html`: Chứa HTML cho `AppComponent`. Nội dung của file này còn được gọi là mẫu.
   Mẫu xác định chế độ xem hoặc những gì bạn thấy trong trình duyệt.
3. `app.component.css`: Chứa các kiểu dáng cho `AppComponent`. Bạn sử dụng file này khi muốn định nghĩa các kiểu dáng chỉ áp dụng cho một thành phần cụ thể, trái ngược với toàn bộ ứng dụng.

Một thành phần trong Angular được tạo thành từ ba phần chính — mẫu, kiểu dáng, và lớp class.
Ví dụ, `app.component.ts`, `app.component.html`, và `app.component.css` cùng nhau tạo nên `AppComponent`.
Cấu trúc này phân tách logic, chế độ xem và kiểu dáng để ứng dụng dễ bảo trì và mở rộng hơn.
Theo cách này, bạn đang sử dụng các thực hành tốt nhất ngay từ đầu.

Angular CLI cũng tạo ra một file để kiểm thử thành phần có tên `app.component.spec.ts`, nhưng hướng dẫn này không đề cập đến việc kiểm thử, vì vậy bạn có thể bỏ qua file đó.
Bất cứ khi nào bạn tạo một thành phần, CLI sẽ tạo các file này trong một thư mục với tên bạn chỉ định và chúng ta sẽ thấy một ví dụ về điều đó sau.

Để tìm hiểu thêm về kiểm thử, hãy xem [hướng dẫn kiểm thử Angular](https://angular.dev/guide/testing).

## Cấu trúc của ứng dụng Angular

Angular được xây dựng bằng TypeScript.
TypeScript là tập hợp cha của JavaScript, nghĩa là bất kỳ JavaScript hợp lệ nào đều là TypeScript hợp lệ.
TypeScript cung cấp kiểu dữ liệu và cú pháp ngắn gọn hơn so với JavaScript thuần, cho bạn một công cụ để tạo code dễ bảo trì hơn và giảm thiểu lỗi.

Các thành phần là khối xây dựng của ứng dụng Angular.
Một thành phần bao gồm một lớp class TypeScript có bộ trang trí `@Component()`.

### Bộ trang trí

Bạn sử dụng bộ trang trí `@Component()` để chỉ định siêu dữ liệu (mẫu HTML và kiểu dáng) về một lớp class.

### Lớp class

Lớp class là nơi bạn đặt bất kỳ logic nào mà thành phần của bạn cần.
Code này có thể bao gồm các hàm, trình xử lý sự kiện, thuộc tính, và tham chiếu đến các dịch vụ, để đặt tên một vài thứ.
Lớp class nằm trong một file có tên như `feature.component.ts`, trong đó `feature` là tên của thành phần của bạn.
Vì vậy, bạn có thể có các file với tên như `header.component.ts`, `signup.component.ts`, hoặc `feed.component.ts`.
Bạn tạo một thành phần với bộ trang trí `@Component()` có siêu dữ liệu cho Angular biết nơi tìm HTML và CSS.
Một thành phần điển hình như sau:

```ts
import { Component } from "@angular/core";

@Component({
  selector: "app-item",
  standalone: true,
  imports: [],
  // the following metadata specifies the location of the other parts of the component
  templateUrl: "./item.component.html",
  styleUrl: "./item.component.css",
})
export class ItemComponent {
  // code goes here
}
```

Thành phần này được gọi là `ItemComponent`, và selector của nó là `app-item`.
Bạn sử dụng selector giống như các thẻ HTML thông thường bằng cách đặt nó trong các mẫu khác, tức là `<app-item></app-item>`.
Khi một selector nằm trong mẫu, trình duyệt sẽ render mẫu của thành phần đó bất cứ khi nào gặp một phiên bản của selector đó.
Hướng dẫn này hướng dẫn bạn tạo hai thành phần và sử dụng một thành phần trong thành phần kia.

> [!NOTE]
> Tên của thành phần trên là `ItemComponent`, cũng là tên của lớp class.
> Tên giống nhau đơn giản vì một thành phần không gì khác hơn là một lớp class được bổ sung bởi bộ trang trí TypeScript.

Mô hình thành phần của Angular cung cấp tính đóng gói mạnh mẽ và cấu trúc ứng dụng trực quan.
Các thành phần cũng giúp ứng dụng của bạn dễ kiểm thử unit hơn và có thể cải thiện khả năng đọc tổng thể của code.

### Mẫu HTML

Mỗi thành phần có một mẫu HTML khai báo cách thành phần đó render.
Bạn có thể định nghĩa mẫu này theo cách nội tuyến hoặc theo đường dẫn file.

Để tham chiếu đến file HTML bên ngoài, hãy sử dụng thuộc tính `templateUrl`:

```ts
@Component({
  selector: "app-root",
  templateUrl: "./app.component.html",
})
export class AppComponent {
  // code goes here
}
```

Để viết HTML nội tuyến, hãy sử dụng thuộc tính `template` và viết HTML trong dấu backtick:

```ts
@Component({
  selector: "app-root",
  template: `<h1>To do application</h1>`,
})
export class AppComponent {
  // code goes here
}
```

Angular mở rộng HTML với cú pháp bổ sung cho phép bạn chèn các giá trị động từ thành phần của mình.
Angular tự động cập nhật DOM được render khi trạng thái của thành phần thay đổi.
Một cách sử dụng tính năng này là chèn văn bản động, như được hiển thị trong ví dụ sau.

```html
<h1>\{{ title }}</h1>
```

Dấu ngoặc nhọn kép hướng dẫn Angular nội suy nội dung bên trong chúng.
Giá trị cho `title` đến từ lớp class của thành phần:

```ts
import { Component } from "@angular/core";

@Component({
  selector: "app-root",
  standalone: true,
  imports: [],
  template: "<h1>\{{ title }}</h1>",
  styleUrl: "./app.component.css",
})
export class AppComponent {
  title = "To do application";
}
```

Khi ứng dụng tải thành phần và mẫu của nó, trình duyệt sẽ thấy như sau:

```html
<h1>To do application</h1>
```

### Kiểu dáng

Một thành phần có thể kế thừa các kiểu dáng toàn cục từ file `styles.css` của ứng dụng và bổ sung hoặc ghi đè chúng bằng các kiểu dáng riêng.
Bạn có thể viết các kiểu dáng dành riêng cho thành phần trực tiếp trong bộ trang trí `@Component()` hoặc chỉ định đường dẫn đến file CSS.

Để bao gồm các kiểu dáng trực tiếp trong bộ trang trí thành phần, hãy sử dụng thuộc tính `styles`:

```ts
@Component({
  selector: "app-root",
  templateUrl: "./app.component.html",
  styles: ["h1 { color: red; }"],
})
export class AppComponent {
  // …
}
```

Thông thường, một thành phần sử dụng kiểu dáng trong một file riêng biệt.
Bạn có thể sử dụng thuộc tính `styleUrl` với đường dẫn đến file CSS dưới dạng chuỗi hoặc `styleUrls` với một mảng chuỗi nếu có nhiều stylesheet CSS bạn muốn bao gồm:

```ts
@Component({
  selector: "app-root",
  templateUrl: "./app.component.html",
  styleUrl: "./app.component.css",
})
export class AppComponent {
  // …
}
```

Với các kiểu dáng dành riêng cho thành phần, bạn có thể tổ chức CSS sao cho dễ bảo trì và di chuyển.

### Các thành phần độc lập

Nên [làm cho các thành phần trở nên độc lập](https://angular.dev/guide/components/importing#standalone-components) trừ khi một dự án đã sử dụng [NgModules](https://angular.dev/guide/ngmodules) (Angular modules) để tổ chức code.
Hướng dẫn này sử dụng [các thành phần độc lập](https://angular.dev/guide/components/importing#standalone-components), dễ bắt đầu hơn.

Thông thường người ta import [`CommonModule`](https://angular.dev/api/common/CommonModule) để thành phần của bạn có thể sử dụng các [chỉ thị](https://angular.dev/guide/directives) và [pipe](https://angular.dev/guide/pipes) phổ biến.

```ts
import { Component } from "@angular/core";
import { CommonModule } from "@angular/common";

@Component({
  standalone: true,
  selector: "app-root",
  templateUrl: "./app.component.html",
  styleUrl: "./app.component.css",
  imports: [CommonModule],
})
export class AppComponent {
  // …
}
```

## Tóm tắt

Đó là phần giới thiệu đầu tiên về Angular của bạn. Tại thời điểm này, bạn đã được thiết lập và sẵn sàng xây dựng ứng dụng Angular, đồng thời có hiểu biết cơ bản về cách Angular hoạt động. Trong bài viết tiếp theo, chúng ta sẽ đào sâu hơn về kiến thức đó và bắt đầu xây dựng cấu trúc của ứng dụng danh sách việc cần làm.

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Angular_todo_list_beginning", "Learn_web_development/Core/Frameworks_libraries")}}
