---
title: Tạo thành phần item
slug: Learn_web_development/Core/Frameworks_libraries/Angular_item_component
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Angular_styling","Learn_web_development/Core/Frameworks_libraries/Angular_filtering", "Learn_web_development/Core/Frameworks_libraries")}}

Các thành phần cung cấp cách để bạn tổ chức ứng dụng. Bài viết này hướng dẫn bạn tạo một thành phần để xử lý các mục riêng lẻ trong danh sách, và thêm chức năng đánh dấu, chỉnh sửa và xóa. Mô hình sự kiện Angular được đề cập ở đây.

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
        Tìm hiểu thêm về các thành phần, bao gồm cách các sự kiện hoạt động để xử lý cập nhật. Thêm chức năng đánh dấu, chỉnh sửa và xóa.
      </td>
    </tr>
  </tbody>
</table>

## Tạo thành phần mới

Tại dòng lệnh, hãy tạo một thành phần có tên `item` với lệnh CLI sau:

```bash
ng generate component item
```

Lệnh `ng generate component` tạo một thành phần và thư mục với tên bạn chỉ định.
Ở đây, tên thư mục và thành phần là `item`.
Bạn có thể tìm thư mục `item` trong thư mục `app`:

```plain
src/app/item
├── item.component.css
├── item.component.html
├── item.component.spec.ts
└── item.component.ts
```

Giống như với `AppComponent`, `ItemComponent` được tạo từ các file sau:

- `item.component.html` cho HTML
- `item.component.ts` cho logic
- `item.component.css` cho kiểu dáng
- `item.component.spec.ts` để kiểm thử thành phần

Bạn có thể thấy tham chiếu đến các file HTML và CSS trong siêu dữ liệu bộ trang trí `@Component()` trong `item.component.ts`.

```ts
@Component({
  selector: "app-item",
  standalone: true,
  imports: [],
  templateUrl: "./item.component.html",
  styleUrl: "./item.component.css",
})
export class ItemComponent {
  // …
}
```

## Thêm HTML cho ItemComponent

`ItemComponent` có thể đảm nhận nhiệm vụ cung cấp cho người dùng cách đánh dấu các mục là đã hoàn thành, chỉnh sửa hoặc xóa chúng.

Thêm đánh dấu để quản lý các mục bằng cách thay thế nội dung giữ chỗ trong `item.component.html` bằng nội dung sau:

```html
<div class="item">
  <input
    [id]="item.description"
    type="checkbox"
    (change)="item.done = !item.done"
    [checked]="item.done" />
  <label [for]="item.description">\{{item.description}}</label>

  @if (!editable) {
  <div class="btn-wrapper">
    <button class="btn" (click)="editable = !editable">Edit</button>
    <button class="btn btn-warn" (click)="remove.emit()">Delete</button>
  </div>
  }

  <!-- This section shows only if user clicks Edit button -->
  @if (editable) {
  <div>
    <input
      class="sm-text-input"
      placeholder="edit item"
      [value]="item.description"
      #editedItem
      (keyup.enter)="saveItem(editedItem.value)" />

    <div class="btn-wrapper">
      <button class="btn" (click)="editable = !editable">Cancel</button>
      <button class="btn btn-save" (click)="saveItem(editedItem.value)">
        Save
      </button>
    </div>
  </div>
  }
</div>
```

Input đầu tiên là một hộp kiểm để người dùng có thể đánh dấu các mục khi hoàn thành.
Dấu ngoặc nhọn kép, `\{{}}`, trong `<label>` cho hộp kiểm biểu thị nội suy của Angular.
Angular sử dụng `\{{item.description}}` để lấy mô tả của `item` hiện tại từ mảng `items`.
Phần tiếp theo giải thích chi tiết cách các thành phần chia sẻ dữ liệu.

Hai nút tiếp theo để chỉnh sửa và xóa mục hiện tại nằm trong `<div>`.
Trên `<div>` này có khối `@if` mà bạn có thể sử dụng để render các phần của mẫu dựa trên một điều kiện.
`@if` này có nghĩa là nếu `editable` là `false`, `<div>` này được render trong mẫu. Nếu `editable` là `true`, Angular xóa `<div>` này khỏi DOM.

```html
@if (!editable) {
<div class="btn-wrapper">
  <button class="btn" (click)="editable = !editable">Edit</button>
  <button class="btn btn-warn" (click)="remove.emit()">Delete</button>
</div>
}
```

Khi người dùng nhấp vào nút **Chỉnh sửa**, `editable` trở thành true, điều này xóa `<div>` này và các con của nó khỏi DOM.
Nếu, thay vì nhấp vào **Chỉnh sửa**, người dùng nhấp vào **Xóa**, `ItemComponent` phát ra một sự kiện thông báo cho `AppComponent` về việc xóa.

`@if` cũng nằm trên `<div>` tiếp theo, nhưng được đặt thành giá trị `editable` là `true`.
Trong trường hợp này, nếu `editable` là `true`, Angular đặt `<div>` và các phần tử con `<input>` và `<button>` vào DOM.

```html
<!-- This section shows only if user clicks Edit button -->
@if (editable) {
<div>
  <input
    class="sm-text-input"
    placeholder="edit item"
    [value]="item.description"
    #editedItem
    (keyup.enter)="saveItem(editedItem.value)" />

  <div class="btn-wrapper">
    <button class="btn" (click)="editable = !editable">Cancel</button>
    <button class="btn btn-save" (click)="saveItem(editedItem.value)">
      Save
    </button>
  </div>
</div>
}
```

Với `[value]="item.description"`, giá trị của `<input>` được ràng buộc với `description` của mục hiện tại.
Ràng buộc này làm cho `description` của mục trở thành giá trị của `<input>`.
Vì vậy nếu `description` là `eat`, `description` đã có trong `<input>`.
Theo cách này, khi người dùng chỉnh sửa mục, giá trị của `<input>` đã là `eat`.

Biến mẫu `#editedItem` trên `<input>` có nghĩa là Angular lưu trữ bất cứ điều gì người dùng gõ vào `<input>` này trong một biến được gọi là `editedItem`.
Sự kiện `keyup` gọi phương thức `saveItem()` và truyền vào giá trị `editedItem` nếu người dùng chọn nhấn enter thay vì nhấp **Lưu**.

Khi người dùng nhấp vào nút **Hủy**, `editable` chuyển về `false`, xóa input và các nút để chỉnh sửa khỏi DOM.
Khi `editable` là `false`, Angular đặt `<div>` với các nút **Chỉnh sửa** và **Xóa** trở lại DOM.

Nhấp vào nút **Lưu** gọi phương thức `saveItem()`.
Phương thức `saveItem()` lấy giá trị từ phần tử `#editedItem` và thay đổi `description` của mục thành chuỗi `editedItem.value`.

## Chuẩn bị AppComponent

Trong phần tiếp theo, bạn sẽ thêm code dựa trên giao tiếp giữa `AppComponent` và `ItemComponent`.
Thêm dòng sau gần đầu file `app.component.ts` để import `Item`:

```ts
import { Item } from "./item";
import { ItemComponent } from "./item/item.component";
```

Sau đó, cấu hình AppComponent bằng cách thêm nội dung sau vào lớp class trong cùng file:

```ts
export class AppComponent {
  // …
  remove(item: Item) {
    this.allItems.splice(this.allItems.indexOf(item), 1);
  }
  // …
}
```

Phương thức `remove()` sử dụng phương thức JavaScript `Array.splice()` để xóa một mục tại `indexOf` mục liên quan.
Nói đơn giản, điều này có nghĩa là phương thức `splice()` xóa mục đó khỏi mảng.
Để biết thêm thông tin về phương thức `splice()`, hãy xem [tài liệu `Array.prototype.splice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice).

## Thêm logic vào ItemComponent

Để sử dụng giao diện người dùng `ItemComponent`, bạn phải thêm logic vào thành phần như các hàm và cách để dữ liệu vào và ra.
Trong `item.component.ts`, hãy chỉnh sửa các import JavaScript như sau:

```ts
import { Component, Input, Output, EventEmitter } from "@angular/core";
import { CommonModule } from "@angular/common";
import { Item } from "../item";
```

Việc thêm `Input`, `Output` và `EventEmitter` cho phép `ItemComponent` chia sẻ dữ liệu với `AppComponent`.
Bằng cách import `Item`, `ItemComponent` có thể hiểu `item` là gì.
Bạn có thể cập nhật `@Component` để sử dụng [`CommonModule`](https://angular.dev/api/common/CommonModule) trong `app/item/item.component.ts` để chúng ta có thể sử dụng các khối `@if`:

```ts
@Component({
  selector: "app-item",
  standalone: true,
  imports: [CommonModule],
  templateUrl: "./item.component.html",
  styleUrl: "./item.component.css",
})
export class ItemComponent {
  // …
}
```

Tiếp theo trong `item.component.ts`, hãy thay thế lớp class `ItemComponent` đã được tạo bằng nội dung sau:

```ts
export class ItemComponent {
  editable = false;

  @Input() item!: Item;
  @Output() remove = new EventEmitter<Item>();

  saveItem(description: string) {
    if (!description) return;

    this.editable = false;
    this.item.description = description;
  }
}
```

Thuộc tính `editable` giúp chuyển đổi một phần của mẫu nơi người dùng có thể chỉnh sửa một mục.
`editable` là cùng một thuộc tính trong HTML như trong câu lệnh `@if`, `@if(editable)`.
Khi bạn sử dụng một thuộc tính trong mẫu, bạn cũng phải khai báo nó trong lớp class.

`@Input()`, `@Output()` và `EventEmitter` tạo điều kiện giao tiếp giữa hai thành phần của bạn.
`@Input()` đóng vai trò như cổng vào để dữ liệu đi vào thành phần, và `@Output()` hoạt động như cổng ra để dữ liệu rời khỏi thành phần.
`@Output()` phải thuộc kiểu `EventEmitter`, để một thành phần có thể phát ra một sự kiện khi có dữ liệu sẵn sàng để chia sẻ với thành phần khác.

> [!NOTE]
> `!` trong khai báo thuộc tính của lớp class được gọi là [khẳng định gán xác định](https://www.typescriptlang.org/docs/handbook/2/classes.html#--strictpropertyinitialization). Toán tử này cho TypeScript biết rằng trường `item` luôn được khởi tạo và không phải là `undefined`, ngay cả khi TypeScript không thể biết điều đó từ định nghĩa của constructor. Nếu toán tử này không được bao gồm trong code của bạn và bạn có cài đặt biên dịch TypeScript nghiêm ngặt, ứng dụng sẽ không biên dịch được.

Sử dụng `@Input()` để chỉ định rằng giá trị của một thuộc tính có thể đến từ bên ngoài thành phần.
Sử dụng `@Output()` kết hợp với `EventEmitter` để chỉ định rằng giá trị của một thuộc tính có thể rời khỏi thành phần để thành phần khác có thể nhận dữ liệu đó.

Phương thức `saveItem()` nhận một đối số là `description` thuộc kiểu `string`.
`description` là văn bản mà người dùng nhập vào `<input>` HTML khi chỉnh sửa một mục trong danh sách.
`description` này là chuỗi giống nhau từ `<input>` với biến mẫu `#editedItem`.

Nếu người dùng không nhập giá trị nhưng nhấp vào **Lưu**, `saveItem()` không trả về gì và không cập nhật `description`.
Nếu bạn không có câu lệnh `if` này, người dùng có thể nhấp vào **Lưu** mà không có gì trong `<input>` HTML, và `description` sẽ trở thành chuỗi rỗng.

Nếu người dùng nhập văn bản và nhấp lưu, `saveItem()` đặt `editable` thành false, làm cho `@if` trong mẫu xóa tính năng chỉnh sửa và render lại các nút **Chỉnh sửa** và **Xóa**.

Mặc dù ứng dụng nên biên dịch tại thời điểm này, bạn cần sử dụng `ItemComponent` trong `AppComponent` để có thể thấy các tính năng mới trong trình duyệt.

## Sử dụng ItemComponent trong AppComponent

Bao gồm một thành phần trong một thành phần khác trong ngữ cảnh quan hệ cha-con cho bạn sự linh hoạt khi sử dụng các thành phần bất cứ nơi nào bạn cần.

`AppComponent` đóng vai trò như vỏ bọc cho ứng dụng nơi bạn có thể bao gồm các thành phần khác.

Để sử dụng `ItemComponent` trong `AppComponent`, hãy đặt selector `ItemComponent` trong mẫu `AppComponent`.
Angular chỉ định selector của một thành phần trong siêu dữ liệu của bộ trang trí `@Component()`.
Trong ví dụ này, chúng ta đã định nghĩa selector là `app-item`:

```ts
@Component({
  selector: "app-item",
  // …
})
export class ItemComponent {
  // …
}
```

Để sử dụng selector `ItemComponent` trong `AppComponent`, bạn thêm phần tử `<app-item>`, tương ứng với selector bạn đã định nghĩa cho lớp class thành phần vào `app.component.html`.
Hãy thay thế danh sách không có thứ tự `<ul>` hiện tại trong `app.component.html` bằng phiên bản cập nhật sau:

```html
<h2>
  \{{items.length}}
  <span> @if (items.length === 1) { item } @else { items } </span>
</h2>

<ul>
  @for (item of items; track item.description) {
  <li>
    <app-item (remove)="remove(item)" [item]="item"></app-item>
  </li>
  }
</ul>
```

Thay đổi `imports` trong `app.component.ts` để bao gồm `ItemComponent` cũng như `CommonModule`:

```ts
@Component({
  standalone: true,
  selector: "app-root",
  templateUrl: "./app.component.html",
  styleUrl: "./app.component.css",
  imports: [CommonModule, ItemComponent],
})
export class AppComponent {
  // …
}
```

Cú pháp dấu ngoặc nhọn kép, `\{{}}`, trong `<h2>` nội suy độ dài của mảng `items` và hiển thị con số.

`<span>` trong `<h2>` sử dụng `@if` và `@else` để xác định xem `<h2>` có nên hiển thị "item" hay "items".
Nếu chỉ có một mục trong danh sách, `<span>` hiển thị "item".
Nếu không, nếu độ dài của mảng `items` là bất kỳ giá trị nào khác ngoài `1`, `<span>` hiển thị "items".

`@for` - khối luồng điều khiển của Angular, được dùng để lặp qua tất cả các mục trong mảng `items`.
`@for` của Angular giống như `@if`, là một khối khác giúp bạn thay đổi cấu trúc DOM trong khi viết ít code hơn.
Đối với mỗi `item`, Angular lặp lại `<li>` và mọi thứ bên trong nó, bao gồm cả `<app-item>`.
Điều này có nghĩa là đối với mỗi mục trong mảng, Angular tạo ra một phiên bản khác của `<app-item>`.
Đối với bất kỳ số lượng mục nào trong mảng, Angular sẽ tạo ra số `<li>` phần tử tương ứng.

Bạn có thể bọc các phần tử khác như `<div>`, `<span`, hoặc `<p>` trong khối `@for`.

`AppComponent` có phương thức `remove()` để xóa mục, được ràng buộc với thuộc tính `remove` trong `ItemComponent`.
Thuộc tính `item` trong dấu ngoặc vuông, `[]`, ràng buộc giá trị của `i` giữa `AppComponent` và `ItemComponent`.

Bây giờ bạn có thể chỉnh sửa và xóa các mục khỏi danh sách.
Khi bạn thêm hoặc xóa các mục, số lượng mục cũng sẽ thay đổi.
Để làm danh sách thân thiện hơn với người dùng, hãy thêm một số kiểu dáng vào `ItemComponent`.

## Thêm kiểu dáng vào ItemComponent

Bạn có thể sử dụng stylesheet của thành phần để thêm các kiểu dáng dành riêng cho thành phần đó.
CSS sau đây thêm các kiểu cơ bản, flexbox cho các nút và hộp kiểm tùy chỉnh.

Dán các kiểu dáng sau vào `item.component.css`.

```css
.item {
  padding: 0.5rem 0 0.75rem 0;
  text-align: left;
  font-size: 1.2rem;
}

.btn-wrapper {
  margin-top: 1rem;
  margin-bottom: 0.5rem;
}

.btn {
  /* menu buttons flexbox styles */
  flex-basis: 49%;
}

.btn-save {
  background-color: black;
  color: white;
  border-color: black;
}

.btn-save:hover {
  background-color: #444242;
}

.btn-save:focus {
  background-color: white;
  color: black;
}

.checkbox-wrapper {
  margin: 0.5rem 0;
}

.btn-warn {
  background-color: #b90000;
  color: white;
  border-color: #9a0000;
}

.btn-warn:hover {
  background-color: #9a0000;
}

.btn-warn:active {
  background-color: #e30000;
  border-color: black;
}

.sm-text-input {
  width: 100%;
  padding: 0.5rem;
  border: 2px solid #555555;
  display: block;
  box-sizing: border-box;
  font-size: 1rem;
  margin: 1rem 0;
}

/* Custom checkboxes
Adapted from https://css-tricks.com/the-checkbox-hack/#custom-designed-radio-buttons-and-checkboxes */

/* Base for label styling */
[type="checkbox"]:not(:checked),
[type="checkbox"]:checked {
  position: absolute;
  left: -9999px;
}
[type="checkbox"]:not(:checked) + label,
[type="checkbox"]:checked + label {
  position: relative;
  padding-left: 1.95em;
  cursor: pointer;
}

/* checkbox aspect */
[type="checkbox"]:not(:checked) + label::before,
[type="checkbox"]:checked + label::before {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 1.25em;
  height: 1.25em;
  border: 2px solid #cccccc;
  background: white;
}

/* checked mark aspect */
[type="checkbox"]:not(:checked) + label::after,
[type="checkbox"]:checked + label::after {
  content: "\2713\0020";
  position: absolute;
  top: 0.15em;
  left: 0.22em;
  font-size: 1.3em;
  line-height: 0.8;
  color: #0d8dee;
  transition: all 0.2s;
  font-family: "Lucida Sans Unicode", "Arial Unicode MS", "Arial";
}
/* checked mark aspect changes */
[type="checkbox"]:not(:checked) + label::after {
  opacity: 0;
  transform: scale(0);
}
[type="checkbox"]:checked + label::after {
  opacity: 1;
  transform: scale(1);
}

/* accessibility */
[type="checkbox"]:checked:focus + label::before,
[type="checkbox"]:not(:checked):focus + label::before {
  border: 2px dotted blue;
}
```

## Tóm tắt

Bây giờ bạn đã có ứng dụng danh sách việc cần làm Angular có kiểu dáng có thể thêm, chỉnh sửa và xóa các mục.
Bước tiếp theo là thêm tính năng lọc để bạn có thể xem các mục đáp ứng tiêu chí cụ thể.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Angular_styling","Learn_web_development/Core/Frameworks_libraries/Angular_filtering", "Learn_web_development/Core/Frameworks_libraries")}}
