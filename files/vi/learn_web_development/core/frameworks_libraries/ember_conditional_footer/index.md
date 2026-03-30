---
title: "Tính tương tác trong Ember: Chức năng footer, render có điều kiện"
slug: Learn_web_development/Core/Frameworks_libraries/Ember_conditional_footer
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Ember_interactivity_events_state","Learn_web_development/Core/Frameworks_libraries/Ember_routing", "Learn_web_development/Core/Frameworks_libraries")}}

Bây giờ đến lúc bắt đầu giải quyết chức năng footer trong ứng dụng. Ở đây chúng ta sẽ làm cho bộ đếm todo cập nhật để hiển thị đúng số todos vẫn cần hoàn thành, và áp dụng đúng kiểu dáng cho các todos đã hoàn thành (tức là khi hộp kiểm đã được đánh dấu). Chúng ta cũng sẽ kết nối nút "Xóa đã hoàn thành". Trong quá trình đó, chúng ta sẽ học về việc sử dụng render có điều kiện trong các mẫu.

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
      <td>
        Tiếp tục học về các lớp class thành phần, bắt đầu xem xét render có điều kiện, và kết nối một số chức năng footer.
      </td>
    </tr>
  </tbody>
</table>

## Kết nối hành vi trong footer

Để làm cho footer hoạt động, chúng ta cần triển khai ba lĩnh vực chức năng sau:

- Bộ đếm todo đang chờ xử lý.
- Bộ lọc cho tất cả, các todos đang hoạt động và đã hoàn thành.
- Một nút để xóa các todos đã hoàn thành.

1. Vì chúng ta cần quyền truy cập vào dịch vụ từ thành phần footer, chúng ta cần tạo một lớp class cho footer. Nhập lệnh terminal sau để làm vậy:

   ```bash
   ember generate component-class footer
   ```

2. Tiếp theo, hãy tìm file `todomvc/app/components/footer.js` mới được tạo và cập nhật nó thành nội dung sau:

   ```ts
   import Component from "@glimmer/component";
   import { inject as service } from "@ember/service";

   export default class FooterComponent extends Component {
     @service("todo-data") todos;
   }
   ```

3. Bây giờ chúng ta cần quay lại file `todo-data.js` và thêm một số chức năng sẽ cho phép chúng ta trả về số todos chưa hoàn thành (hữu ích để hiển thị số còn lại) và xóa các todos đã hoàn thành khỏi danh sách (đây là chức năng "Xóa đã hoàn thành" cần).

   Trong `todo-data.js`, hãy thêm getter sau bên dưới getter `all()` hiện có để định nghĩa những gì thực sự là todos chưa hoàn thành:

   ```ts
   export default class TodoDataService extends Service {
     // …
     get incomplete() {
       return this.todos.filter((todo) => !todo.isCompleted);
     }
     // …
   }
   ```

   Sử dụng phương thức [`filter()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter), chúng ta đang yêu cầu tất cả các mục todo có thuộc tính `isCompleted` bằng `false`, và vì `isCompleted` là `@tracked` trong đối tượng `Todo`, getter này sẽ tính toán lại khi giá trị thay đổi trên một Object trong mảng.

4. Tiếp theo, hãy thêm hành động sau bên dưới hành động `add(text)` hiện có:

   ```ts
   export default class TodoDataService extends Service {
     // …
     @action
     clearCompleted() {
       this.todos = this.incomplete;
     }
     // …
   }
   ```

   Điều này khá tốt để xóa todos — chúng ta chỉ cần đặt mảng `todos` bằng danh sách todos chưa hoàn thành.

5. Cuối cùng, chúng ta cần sử dụng chức năng mới này trong mẫu `footer.hbs`. Hãy đến file này ngay bây giờ.
6. Trước tiên, hãy thay thế dòng này:

   ```hbs
   <strong>0</strong> todos left
   ```

   Bằng dòng này, điền số chưa hoàn thành bằng độ dài của mảng `incomplete`:

   ```hbs
   <strong>\{{this.todos.incomplete.length}}</strong> todos left
   ```

7. Tiếp theo, hãy thay thế dòng này:

   ```hbs
   <button type="button" class="clear-completed">
   ```

   Bằng dòng này:

   ```hbs
   <button type="button" class="clear-completed" \{{on 'click' this.todos.clearCompleted}}>
   ```

Vì vậy, bây giờ khi nhút được nhấp, hành động `clearCompleted()` mà chúng ta đã thêm trước đó được chạy.
Tuy nhiên, nếu bạn cố nhấp vào nút "Xóa Đã Hoàn Thành" ngay bây giờ, nó sẽ không có vẻ làm bất cứ điều gì, vì hiện tại không có cách nào để "hoàn thành" một todo. Chúng ta cần kết nối mẫu `todo.hbs` với dịch vụ, để đánh dấu hộp kiểm liên quan thay đổi trạng thái của mỗi todo. Chúng ta sẽ làm điều đó tiếp theo.

## Vấn đề số nhiều todo/todos

Phần trên ổn, nhưng chúng ta có một vấn đề nhỏ khác phải giải quyết. Chỉ báo "todos left" luôn nói "x todos left", ngay cả khi chỉ còn một todo, đây là ngữ pháp không đúng!

Để sửa điều này, chúng ta cần cập nhật phần này của mẫu để bao gồm một số render có điều kiện. Trong Ember, bạn có thể render có điều kiện các phần của mẫu bằng cách sử dụng [nội dung có điều kiện](https://guides.emberjs.com/v3.18.0/components/conditional-content/); một ví dụ khối đơn giản trông như thế này:

```hbs
\{{#if this.thingIsTrue}} Content for the block form of "if"
\{{/if}}
```

Vì vậy, hãy thử thay thế phần này của `footer.hbs`:

```hbs
<strong>\{{this.todos.incomplete.length}}</strong> todos left
```

bằng nội dung sau:

```hbs
<strong>\{{this.todos.incomplete.length}}</strong>
\{{#if this.todos.incomplete.length === 1}} todo
\{{else}} todos
\{{/if}} left
```

Tuy nhiên, điều này sẽ gây ra lỗi — trong Ember, các câu lệnh if đơn giản này hiện tại chỉ có thể kiểm tra giá trị truthy/falsy, không phải biểu thức phức tạp hơn như phép so sánh. Để sửa điều này, chúng ta sẽ phải thêm getter vào `todo-data.js` để trả về kết quả của `this.incomplete.length === 1`, và sau đó gọi nó trong mẫu.

Thêm getter mới sau vào `todo-data.js`, ngay bên dưới các getter hiện có. Lưu ý rằng ở đây chúng ta cần `this.incomplete.length`, không phải `this.todos.incomplete.length`, vì chúng ta đang làm điều này bên trong dịch vụ, nơi getter `incomplete()` có sẵn trực tiếp (trong mẫu, nội dung của dịch vụ được làm cho có sẵn dưới dạng `todos` thông qua dòng `@service("todo-data") todos;` bên trong lớp class footer, do đó là `this.todos.incomplete.length` ở đó).

```ts
export default class TodoDataService extends Service {
  // …
  get todoCountIsOne() {
    return this.incomplete.length === 1;
  }
  // …
}
```

Sau đó quay lại `footer.hbs` và cập nhật phần mẫu trước mà chúng ta đã chỉnh sửa thành nội dung sau:

```hbs
<strong>\{{this.todos.incomplete.length}}</strong>
\{{#if this.todos.todoCountIsOne}}todo\{{else}}todos\{{/if}} left
```

Bây giờ hãy lưu và kiểm thử, và bạn sẽ thấy cách số nhiều đúng được sử dụng khi bạn chỉ có một mục todo!

Lưu ý rằng đây là dạng khối của `if` trong Ember; bạn cũng có thể sử dụng dạng nội tuyến:

```hbs
\{{if this.todos.todoCountIsOne "todo" "todos"}}
```

## Hoàn thành todos

Như với các thành phần khác, chúng ta cần một lớp class để truy cập dịch vụ.

### Tạo lớp class todo

1. Chạy lệnh sau trong terminal:

   ```bash
   ember generate component-class todo
   ```

2. Bây giờ hãy đến file `todomvc/app/components/todo.js` mới được tạo và cập nhật nội dung để trông như sau, để cung cấp cho thành phần todo quyền truy cập dịch vụ:

   ```ts
   import Component from "@glimmer/component";
   import { inject as service } from "@ember/service";

   export default class TodoComponent extends Component {
     @service("todo-data") todos;
   }
   ```

3. Tiếp theo, hãy quay lại file dịch vụ `todo-data.js` và thêm hành động sau ngay bên dưới các hành động trước, sẽ cho phép chúng ta chuyển đổi trạng thái hoàn thành cho mỗi todo:

   ```ts
   export default class TodoDataService extends Service {
     // …
     @action
     toggleCompletion(todo) {
       todo.isCompleted = !todo.isCompleted;
     }
     // …
   }
   ```

### Cập nhật mẫu để hiển thị trạng thái hoàn thành

Cuối cùng, chúng ta sẽ chỉnh sửa mẫu `todo.hbs` sao cho giá trị của hộp kiểm bây giờ được ràng buộc với thuộc tính `isCompleted` trên todo, và để khi thay đổi, phương thức `toggleCompletion()` trên dịch vụ todo được gọi.

1. Trong `todo.hbs`, trước tiên tìm dòng sau:

   ```hbs
   <li>
   ```

   Và thay thế nó bằng dòng này — bạn sẽ nhận thấy rằng ở đây chúng ta đang sử dụng một số nội dung có điều kiện nữa để thêm giá trị class nếu thích hợp:

   ```hbs-nolint
   <li class=\{{ if @todo.isCompleted 'completed' }}>
   ```

2. Tiếp theo, tìm dòng sau:

   ```hbs-nolint
   <input
     aria-label="Toggle the completion of this todo"
     class="toggle"
     type="checkbox"
   >
   ```

   Và thay thế nó bằng dòng này:

   ```hbs
   <input
     class="toggle"
     type="checkbox"
     aria-label="Toggle the completion of this todo"
     checked=\{{ @todo.isCompleted }}
     \{{ on 'change' (fn this.todos.toggleCompletion @todo) }}
   >
   ```

   > [!NOTE]
   > Đoạn trích trên sử dụng từ khóa mới dành riêng cho Ember — `fn`. `fn` cho phép [ứng dụng một phần](https://en.wikipedia.org/wiki/Partial_application), tương tự như [`bind`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind), nhưng nó không bao giờ thay đổi ngữ cảnh gọi; điều này tương đương với việc sử dụng `bind` với đối số `null` đầu tiên.

Hãy thử khởi động lại máy chủ dev và đến `localhost:4200` lại, và bạn sẽ thấy rằng bây giờ chúng ta có bộ đếm "todos left" và nút Xóa hoạt động đầy đủ:

![todos being marked as complete, and cleared](todos-being-marked-completed-and-cleared.gif)

Nếu bạn tự hỏi tại sao chúng ta không chỉ thực hiện chuyển đổi trên thành phần, vì hàm hoàn toàn độc lập và không cần bất cứ điều gì từ dịch vụ, thì bạn đặt câu hỏi đúng 100%! Tuy nhiên, vì _cuối cùng_, chúng ta sẽ muốn lưu trữ hoặc đồng bộ hóa tất cả các thay đổi với danh sách todos vào [local storage](/en-US/docs/Web/API/Window/localStorage) (xem [phiên bản cuối cùng của ứng dụng](https://nullvoxpopuli.github.io/ember-todomvc-tutorial/)), điều hợp lý là có tất cả các hoạt động thay đổi trạng thái lâu dài ở cùng một nơi.

## Tóm tắt

Đủ rồi cho bây giờ. Tại thời điểm này, không chỉ chúng ta có thể đánh dấu todos là hoàn thành, mà chúng ta cũng có thể xóa chúng. Bây giờ điều duy nhất còn lại để kết nối footer là ba liên kết lọc: "Tất cả", "Đang hoạt động" và "Đã hoàn thành". Chúng ta sẽ làm điều đó trong bài viết tiếp theo, sử dụng Định tuyến.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Ember_interactivity_events_state","Learn_web_development/Core/Frameworks_libraries/Ember_routing", "Learn_web_development/Core/Frameworks_libraries")}}
