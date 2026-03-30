---
title: Bắt đầu ứng dụng danh sách việc cần làm với Angular
slug: Learn_web_development/Core/Frameworks_libraries/Angular_todo_list_beginning
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Angular_getting_started","Learn_web_development/Core/Frameworks_libraries/Angular_styling", "Learn_web_development/Core/Frameworks_libraries")}}

Tại thời điểm này, chúng ta đã sẵn sàng để bắt đầu tạo ứng dụng danh sách việc cần làm bằng Angular. Ứng dụng hoàn thiện sẽ hiển thị một danh sách các mục việc cần làm và bao gồm các tính năng chỉnh sửa, xóa và thêm. Trong bài viết này, bạn sẽ tìm hiểu cấu trúc ứng dụng và dần dần hiển thị danh sách cơ bản các mục việc cần làm.

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
        Tạo cấu trúc ứng dụng cơ bản, hiển thị danh sách các mục việc cần làm,
        và hiểu các khái niệm Angular cơ bản như cấu trúc thành phần, chia sẻ dữ liệu giữa các thành phần, và tạo nội dung vòng lặp.
      </td>
    </tr>
  </tbody>
</table>

## Cấu trúc ứng dụng việc cần làm

Giống như bất kỳ ứng dụng web nào, một ứng dụng Angular có `index.html` là điểm vào. `index.html` thực chất là mẫu HTML cấp cao nhất của ứng dụng:

```html
<!doctype html>
<html lang="en">
  <head>
    <!-- ... -->
  </head>
  <body>
    <app-root></app-root>
  </body>
</html>
```

Trong thẻ `<body>`, Angular sử dụng một phần tử đặc biệt — `<app-root>` — để chèn thành phần chính của bạn, từ đó bao gồm các thành phần khác mà bạn tạo.
Thông thường, bạn không cần phải chạm vào `index.html`, và bạn chủ yếu tập trung công việc vào các khu vực chuyên biệt của ứng dụng được gọi là các thành phần.

### Tổ chức ứng dụng của bạn với các thành phần

Các thành phần là khối xây dựng trung tâm của các ứng dụng Angular.
Ứng dụng việc cần làm này có hai thành phần — một thành phần làm nền tảng cho ứng dụng, và một thành phần để xử lý các mục việc cần làm.

Mỗi thành phần được tạo từ một lớp class TypeScript, HTML và CSS.
TypeScript biên dịch, hay chuyển đổi, sang JavaScript, có nghĩa là ứng dụng của bạn cuối cùng có thể chạy bằng JavaScript thuần nhưng bạn có sự tiện lợi khi sử dụng các tính năng mở rộng và cú pháp hợp lý hóa của TypeScript.

### Luồng điều khiển với các khối @if và @for

Hướng dẫn này đề cập đến hai [khối luồng điều khiển](https://angular.dev/guide/templates/control-flow) Angular quan trọng, cho framework biết khi nào và cách các mẫu của bạn nên được render.
Khối đầu tiên mà hướng dẫn này đề cập là khối [`@for`](https://angular.dev/api/core/@for), lặp qua một tập hợp và lặp lại nội dung của một khối.

Khối thứ hai mà bạn học trong hướng dẫn này là [`@if`](https://angular.dev/api/core/@if).
Bạn có thể sử dụng `@if` để hiển thị nội dung dựa trên một điều kiện.
Ví dụ, nếu người dùng nhấp vào nút "chỉnh sửa", bạn có thể hiển thị các phần tử được sử dụng để chỉnh sửa một mục.
Nếu người dùng nhấp vào "hủy", bạn có thể xóa các phần tử được sử dụng để chỉnh sửa.

### Chia sẻ dữ liệu giữa các thành phần

Trong ứng dụng việc cần làm này, bạn cấu hình các thành phần của mình để chia sẻ dữ liệu.
Để thêm các mục mới vào danh sách việc cần làm, thành phần chính phải gửi mục mới đến thành phần thứ hai.
Thành phần thứ hai này quản lý các mục và chịu trách nhiệm chỉnh sửa, đánh dấu là hoàn thành, và xóa từng mục.

Bạn thực hiện chia sẻ dữ liệu giữa các thành phần Angular với các bộ trang trí đặc biệt được gọi là `@Input()` và `@Output()`.
Bạn sử dụng các bộ trang trí này để chỉ định rằng các thuộc tính nhất định cho phép dữ liệu đi vào hoặc ra khỏi một thành phần.
Để sử dụng `@Output()`, bạn phát ra một sự kiện trong một thành phần để thành phần kia biết rằng có dữ liệu có sẵn.

## Định nghĩa Item

Trong thư mục `app`, hãy tạo một file mới có tên `item.ts` với nội dung sau:

```ts
export interface Item {
  description: string;
  done: boolean;
}
```

Bạn sẽ không sử dụng file này cho đến [sau này](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Angular_item_component#add_logic_to_itemcomponent), nhưng đây là thời điểm tốt để biết và ghi lại kiến thức về một `item` là gì. Giao diện `Item` tạo ra một mô hình đối tượng `item` để ứng dụng của bạn sẽ hiểu `item` là gì. Với danh sách việc cần làm này, một `item` là một đối tượng có mô tả và có thể được đánh dấu là hoàn thành.

## Thêm logic vào AppComponent

Bây giờ bạn đã biết `item` là gì, bạn có thể cung cấp cho ứng dụng một số mục bằng cách thêm chúng vào ứng dụng.
Trong `app.component.ts`, hãy thay thế nội dung bằng nội dung sau:

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
  componentTitle = "My To Do List";

  filter: "all" | "active" | "done" = "all";

  allItems = [
    { description: "eat", done: true },
    { description: "sleep", done: false },
    { description: "play", done: false },
    { description: "laugh", done: false },
  ];

  get items() {
    if (this.filter === "all") {
      return this.allItems;
    }
    return this.allItems.filter((item) =>
      this.filter === "done" ? item.done : !item.done,
    );
  }
}
```

Hai dòng đầu tiên là các import JavaScript. Trong trường hợp này, chúng đang import các thư viện Angular.
Bộ trang trí `@Component()` chỉ định siêu dữ liệu về `AppComponent`.
Dưới đây là thêm thông tin về siêu dữ liệu chúng ta đang sử dụng:

- [`standalone`](https://angular.dev/api/core/Component#standalone): Mô tả liệu thành phần có cần [NgModule](https://angular.dev/guide/ngmodules#the-basic-ngmodule) hay không.
  Ứng dụng của bạn sẽ trực tiếp quản lý các phụ thuộc mẫu (thành phần, chỉ thị, v.v.) bằng cách sử dụng imports khi nó là standalone.
- [`selector`](https://angular.dev/api/core/Directive#selector): Cho bạn biết selector CSS mà bạn sử dụng trong mẫu để đặt thành phần này. Ở đây là `'app-root'`.
  Trong `index.html`, trong thẻ `body`, Angular CLI đã thêm `<app-root></app-root>` khi tạo ứng dụng của bạn.
  Bạn sử dụng tất cả các selector thành phần theo cách tương tự bằng cách thêm chúng vào các mẫu HTML thành phần khác.
- [`templateUrl`](https://angular.dev/api/core/Component#templateUrl): Chỉ định file HTML để liên kết với thành phần này.
  Ở đây là, `'./app.component.html'`,
- [`styleUrl`](https://angular.dev/api/core/Component#styleUrl): Cung cấp vị trí và tên của file cho các kiểu dáng áp dụng riêng cho thành phần này. Ở đây là `'./app.component.css'`.
- [`imports`](https://angular.dev/api/core/Component#imports): Cho phép bạn chỉ định các phụ thuộc của thành phần có thể được sử dụng trong mẫu của nó.

Thuộc tính `filter` thuộc kiểu `union`, nghĩa là `filter` có thể có giá trị `all`, `active`, hoặc `done`.
Với kiểu `union`, nếu bạn gõ sai trong giá trị bạn gán cho thuộc tính `filter`, TypeScript sẽ cho bạn biết để bạn có thể bắt lỗi sớm.
Hướng dẫn này chỉ cho bạn cách thêm bộ lọc trong một bước sau, nhưng bạn cũng có thể sử dụng bộ lọc để hiển thị danh sách mặc định của tất cả các mục.

Mảng `allItems` chứa các mục việc cần làm và liệu chúng đã hoàn thành hay chưa.
Mục đầu tiên, `eat`, có giá trị `done` là true.

Getter `get items()` lấy các mục từ mảng `allItems` nếu `filter` bằng `all`. Nếu không, `get items()` trả về các mục đã hoàn thành hoặc đang chờ xử lý tùy thuộc vào cách người dùng lọc chế độ xem.
Getter cũng thiết lập tên của mảng là `items`, mà bạn sẽ sử dụng trong phần tiếp theo.

## Thêm HTML vào mẫu AppComponent

Để xem danh sách các mục trong trình duyệt, hãy thay thế nội dung của `app.component.html` bằng HTML sau:

```html
<div class="main">
  <h1>\{{ componentTitle }}</h1>
  <h2>What would you like to do today?</h2>

  <ul>
    @for(item of items; track item.description){
    <li>\{{item.description}}</li>
    }
  </ul>
</div>
```

`<li>` nằm bên trong khối `@for` lặp qua các mục trong mảng `items`.
Đối với mỗi mục, một `<li>` mới được tạo.
Dấu ngoặc nhọn kép chứa `item.description` hướng dẫn Angular điền vào mỗi `<li>` bằng văn bản mô tả của từng mục.

Từ khóa `track` trong khối `@for` của Angular giúp Angular xác định những mục nào trong mảng đã thay đổi, được thêm vào, hoặc bị xóa.
Điều này giúp Angular dễ dàng và nhanh hơn trong việc cập nhật DOM khi mảng được sửa đổi.

Trong trình duyệt, bạn sẽ thấy danh sách các mục như sau:

```plain
My To Do List
What would you like to do today?

* eat
* sleep
* play
* laugh
```

## Thêm mục vào danh sách

Một danh sách việc cần làm cần có cách để thêm mục, vì vậy hãy bắt đầu.
Trong `app.component.ts`, hãy thêm phương thức sau vào lớp class sau mảng `allItems`:

```ts
export class AppComponent {
  // …
  addItem(description: string) {
    if (!description) return;

    this.allItems.unshift({
      description,
      done: false,
    });
  }
  // …
}
```

Phương thức `addItem()` nhận một mục mà người dùng cung cấp và thêm nó vào mảng khi người dùng nhấp vào nút **Thêm**.
Phương thức `addItem()` sử dụng phương thức mảng `unshift()` để thêm một mục mới vào đầu mảng và đầu danh sách.
Bạn cũng có thể sử dụng `push()`, sẽ thêm mục mới vào cuối mảng và cuối danh sách.

Để sử dụng phương thức `addItem()`, hãy chỉnh sửa HTML trong mẫu `AppComponent`.
Trong `app.component.html`, hãy thay thế `<h2>` bằng nội dung sau:

```html
<label for="addItemInput">What would you like to do today?</label>

<input
  #newItem
  placeholder="add an item"
  (keyup.enter)="addItem(newItem.value); newItem.value = ''"
  class="lg-text-input"
  id="addItemInput" />

<button class="btn-primary" (click)="addItem(newItem.value)">Add</button>
```

Trong HTML trên, `#newItem` là biến mẫu. Biến mẫu trong trường hợp này sử dụng phần tử `<input>` làm giá trị của nó. Các biến mẫu có thể được tham chiếu ở bất kỳ đâu trong mẫu của thành phần.

Khi người dùng nhập một mục mới vào trường `<input>` và nhấn **Enter**, phương thức `addItem()` thêm giá trị vào mảng `allItems`.
Nhấn phím **Enter** cũng đặt lại giá trị của `<input>` thành chuỗi rỗng. Biến mẫu `#newItem` được sử dụng để truy cập giá trị của phần tử `<input>` trong mẫu.
Thay vì nhấn phím **Enter**, người dùng cũng có thể nhấp vào nút **Thêm**, gọi cùng phương thức `addItem()`.

## Tóm tắt

Bây giờ bạn đã có danh sách việc cần làm cơ bản hiển thị trong trình duyệt. Đó là tiến trình tuyệt vời! Tất nhiên, chúng ta còn nhiều việc phải làm. Trong bài viết tiếp theo, chúng ta sẽ xem xét việc thêm một số kiểu dáng vào ứng dụng.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Angular_getting_started","Learn_web_development/Core/Frameworks_libraries/Angular_styling", "Learn_web_development/Core/Frameworks_libraries")}}
