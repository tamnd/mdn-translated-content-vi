---
title: "Tính tương tác trong Ember: Sự kiện, lớp class và trạng thái"
slug: Learn_web_development/Core/Frameworks_libraries/Ember_interactivity_events_state
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Ember_structure_componentization","Learn_web_development/Core/Frameworks_libraries/Ember_conditional_footer", "Learn_web_development/Core/Frameworks_libraries")}}

Tại thời điểm này, chúng ta sẽ bắt đầu thêm một số tính tương tác vào ứng dụng, cung cấp khả năng thêm và hiển thị các mục todo mới. Trong quá trình đó, chúng ta sẽ xem xét cách sử dụng các sự kiện trong Ember, tạo các lớp class thành phần để chứa code JavaScript kiểm soát các tính năng tương tác, và thiết lập một dịch vụ để theo dõi trạng thái dữ liệu của ứng dụng.

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
        Tìm hiểu cách tạo các lớp class thành phần và sử dụng các sự kiện để kiểm soát tính tương tác, và theo dõi trạng thái ứng dụng bằng dịch vụ.
      </td>
    </tr>
  </tbody>
</table>

## Thêm tính tương tác

Bây giờ chúng ta đã có phiên bản thành phần hóa được tái cấu trúc của ứng dụng todo, hãy xem qua cách chúng ta có thể thêm tính tương tác cần thiết để làm cho ứng dụng hoạt động.

Khi bắt đầu nghĩ về tính tương tác, tốt là khai báo mục tiêu và trách nhiệm của mỗi thành phần. Trong các phần dưới đây, chúng ta sẽ làm điều này cho từng thành phần, và sau đó hướng dẫn bạn cách triển khai chức năng.

## Tạo todos

Đối với tiêu đề card/input todo, chúng ta muốn có thể gửi nhiệm vụ todo đã nhập khi nhấn phím <kbd>Enter</kbd> và để nó xuất hiện trong danh sách todos.

Chúng ta muốn có thể bắt văn bản được nhập vào input. Chúng ta làm điều này để code JavaScript biết những gì chúng ta đã nhập, và chúng ta có thể lưu todo và truyền văn bản đó đến thành phần danh sách todo để hiển thị.

Chúng ta có thể bắt sự kiện [`keydown`](/en-US/docs/Web/API/Element/keydown_event) thông qua [on modifier](https://api.emberjs.com/ember/3.16/classes/Ember.Templates.helpers#on), đây chỉ là đường cú pháp Ember xung quanh [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener) và [`removeEventListener`](/en-US/docs/Web/API/EventTarget/removeEventListener) (xem [Giới thiệu về sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Events) nếu cần).

Thêm dòng mới được hiển thị bên dưới vào file `header.hbs` của bạn:

```hbs
<input
  class='new-todo'
  aria-label='What needs to be done?'
  placeholder='What needs to be done?'
  autofocus
  \{{on 'keydown' this.onKeyDown}}
>
```

Thuộc tính mới này nằm trong dấu ngoặc nhọn kép, cho bạn biết nó là một phần của cú pháp mẫu động của Ember. Đối số đầu tiên được truyền cho `on` là loại sự kiện cần phản hồi (`keydown`), và đối số cuối cùng là trình xử lý sự kiện — code sẽ chạy để phản hồi sự kiện `keydown` được kích hoạt. Như bạn có thể mong đợi khi làm việc với [các đối tượng JavaScript thuần](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#what_is_this), từ khóa `this` tham chiếu đến "ngữ cảnh" hoặc "phạm vi" của thành phần. `this` của một thành phần sẽ khác với `this` của thành phần khác.

Chúng ta có thể định nghĩa những gì có sẵn bên trong `this` bằng cách tạo một lớp class thành phần để đi kèm với thành phần của bạn. Đây là một lớp class JavaScript thuần và không có ý nghĩa đặc biệt với Ember, ngoài việc _mở rộng_ từ superclass `Component`.

Để tạo lớp class header đi kèm với thành phần header của bạn, hãy gõ lệnh này vào terminal:

```bash
ember generate component-class header
```

Lệnh này sẽ tạo file lớp class rỗng sau — `todomvc/app/components/header.js`:

```js
import Component from "@glimmer/component";

export default class HeaderComponent extends Component {}
```

Bên trong file này, chúng ta sẽ triển khai code trình xử lý sự kiện. Hãy cập nhật nội dung thành như sau:

```js
import Component from "@glimmer/component";
import { action } from "@ember/object";

export default class HeaderComponent extends Component {
  @action
  onKeyDown({ target, key }) {
    let text = target.value.trim();
    let hasValue = Boolean(text);

    if (key === "Enter" && hasValue) {
      alert(text);

      target.value = "";
    }
  }
}
```

Bộ trang trí `@action` là code dành riêng cho Ember duy nhất ở đây (ngoài việc mở rộng từ superclass `Component` và các mục dành riêng cho Ember mà chúng ta đang import bằng [cú pháp mô-đun JavaScript](/en-US/docs/Web/JavaScript/Guide/Modules)) — phần còn lại của file là JavaScript thuần và sẽ hoạt động trong bất kỳ ứng dụng nào. Bộ trang trí `@action` khai báo rằng hàm là một "hành động", nghĩa là đây là một loại hàm sẽ được gọi từ một sự kiện xảy ra trong mẫu. `@action` cũng ràng buộc `this` của hàm với phiên bản lớp class.

> [!NOTE]
> Bộ trang trí về cơ bản là hàm bao bọc, bao bọc và gọi các hàm hoặc thuộc tính khác, cung cấp thêm chức năng trong quá trình đó. Ví dụ, bộ trang trí `@tracked` (xem một chút sau đó) chạy code mà nó được áp dụng, nhưng ngoài ra theo dõi nó và tự động cập nhật ứng dụng khi các giá trị thay đổi. [Đọc JavaScript Decorators: What They Are and When to Use Them](https://www.sitepoint.com/javascript-decorators-what-they-are/) để biết thêm thông tin chung về các bộ trang trí.

Quay lại tab trình duyệt của chúng ta với ứng dụng đang chạy, chúng ta có thể nhập bất kỳ điều gì chúng ta muốn, và khi nhấn <kbd>Enter</kbd>, chúng ta sẽ được chào bằng thông báo cảnh báo cho chúng ta biết chính xác những gì chúng ta đã nhập.

![the initial placeholder state of the add function, showing the text entered into the input elements being alerted back to you.](todos-hello-there-alert.png)

Với tính tương tác của input header được giải quyết xong, chúng ta cần một nơi để lưu trữ todos để các thành phần khác có thể truy cập chúng.

## Lưu trữ Todos với dịch vụ

Ember có quản lý **trạng thái** cấp ứng dụng tích hợp sẵn mà chúng ta có thể sử dụng để quản lý việc lưu trữ todos và cho phép mỗi thành phần của chúng ta truy cập dữ liệu từ trạng thái cấp ứng dụng đó. Ember gọi các cấu trúc này là [Dịch vụ](https://guides.emberjs.com/release/services/), và chúng tồn tại trong suốt thời gian của trang (làm mới trang sẽ xóa chúng; lưu trữ dữ liệu lâu hơn nằm ngoài phạm vi của hướng dẫn này).

Chạy lệnh terminal này để tạo dịch vụ để chúng ta lưu trữ dữ liệu danh sách todo:

```bash
ember generate service todo-data
```

Điều này sẽ cho bạn đầu ra terminal như thế này:

```plain
installing service
  create app/services/todo-data.js
installing service-test
  create tests/unit/services/todo-data-test.js
```

Điều này tạo ra file `todo-data.js` bên trong thư mục `todomvc/app/services` để chứa dịch vụ của chúng ta, ban đầu chứa câu lệnh import và lớp class rỗng:

```js
import Service from "@ember/service";

export default class TodoDataService extends Service {}
```

Trước tiên, chúng ta muốn định nghĩa _todo là gì_. Chúng ta biết rằng chúng ta muốn theo dõi cả văn bản của todo và liệu nó có hoàn thành hay không.

Thêm câu lệnh `import` sau bên dưới câu lệnh hiện có:

```js
import { tracked } from "@glimmer/tracking";
```

Bây giờ hãy thêm lớp class sau bên dưới dòng trước bạn đã thêm:

```js
class Todo {
  @tracked text = "";
  @tracked isCompleted = false;

  constructor(text) {
    this.text = text;
  }
}
```

Lớp class này đại diện cho một todo — nó chứa thuộc tính `@tracked text` chứa văn bản của todo, và thuộc tính `@tracked isCompleted` chỉ định liệu todo đã hoàn thành hay chưa. Khi được khởi tạo, đối tượng `Todo` sẽ có giá trị `text` ban đầu bằng văn bản được cho khi tạo (xem bên dưới), và giá trị `isCompleted` là `false`. Phần dành riêng cho Ember duy nhất của lớp class này là bộ trang trí `@tracked` — điều này kết nối vào hệ thống phản ứng và cho phép Ember tự động cập nhật những gì bạn thấy trong ứng dụng nếu các thuộc tính được theo dõi thay đổi. [Thông tin thêm về tracked có thể được tìm thấy ở đây](https://api.emberjs.com/ember/3.15/functions/@glimmer%2Ftracking/tracked).

Bây giờ đến lúc thêm vào phần thân của dịch vụ.

Đầu tiên hãy thêm câu lệnh `import` khác bên dưới câu lệnh trước, để các hành động có sẵn bên trong dịch vụ:

```js
import { action } from "@ember/object";
```

Cập nhật khối `export default class TodoDataService extends Service { }` hiện có như sau:

```js
export default class TodoDataService extends Service {
  @tracked todos = [];

  @action
  add(text) {
    let newTodo = new Todo(text);

    this.todos = [...this.todos, newTodo];
  }
}
```

Ở đây, thuộc tính `todos` trên dịch vụ sẽ duy trì danh sách todos chứa trong một mảng, và chúng ta sẽ đánh dấu nó với `@tracked`, vì khi giá trị của `todos` được cập nhật, chúng ta muốn UI cập nhật cũng vậy.

Và giống như trước đây, hàm `add()` sẽ được gọi từ mẫu được chú thích với bộ trang trí `@action` để ràng buộc nó với phiên bản lớp class. Chúng ta [trải rộng mảng `todos`](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) để thêm `newTodo` vào nó, tạo ra mảng mới và sẽ kích hoạt hệ thống phản ứng để cập nhật UI.

## Sử dụng dịch vụ từ thành phần header

Bây giờ chúng ta đã định nghĩa cách thêm todos, chúng ta có thể tương tác với dịch vụ này từ thành phần input `header.js` để thực sự bắt đầu thêm chúng.

Trước tiên, dịch vụ cần được tiêm vào mẫu thông qua bộ trang trí `@inject`, mà chúng ta sẽ đổi tên thành `@service` để rõ ràng về ngữ nghĩa. Để làm điều này, hãy thêm dòng `import` sau vào `header.js`, bên dưới hai dòng `import` hiện có:

```js
import { inject as service } from "@ember/service";
```

Với import này, chúng ta có thể làm cho dịch vụ `todo-data` có sẵn bên trong lớp class `HeaderComponent` thông qua đối tượng `todos`, sử dụng bộ trang trí `@service`. Thêm dòng sau ngay bên dưới dòng mở `export…`:

```js
export default class HeaderComponent extends Component {
  @service("todo-data") todos;
  // …
}
```

Bây giờ dòng `alert(text);` giữ chỗ có thể được thay thế bằng lời gọi đến hàm `add()` mới. Hãy thay thế nó bằng nội dung sau:

```js
this.todos.add(text);
```

Nếu chúng ta thử điều này trong ứng dụng todo trong trình duyệt (`npm start`, đến `localhost:4200`), nó sẽ trông như không có gì xảy ra sau khi nhấn phím <kbd>Enter</kbd> (mặc dù thực tế là ứng dụng xây dựng không có lỗi nào là dấu hiệu tốt). Tuy nhiên, sử dụng [Ember Inspector](https://guides.emberjs.com/release/ember-inspector/installation/), chúng ta có thể thấy todo của chúng ta đã được thêm:

![The app being shown in the Ember inspector, to prove that added todos are being stored by the service, even if they are not being displayed in the UI yet](todos-in-ember-inspector.gif)

## Hiển thị todos

Bây giờ chúng ta biết rằng chúng ta có thể tạo todos, cần có cách để hoán đổi các todos "Buy Movie Tickets" tĩnh với các todos chúng ta thực sự đang tạo. Trong thành phần `TodoList`, chúng ta sẽ muốn lấy todos ra khỏi dịch vụ và render thành phần `Todo` cho mỗi todo.

Để lấy todos từ dịch vụ, thành phần `TodoList` của chúng ta trước tiên cần lớp class thành phần backing để chứa chức năng này. Nhấn <kbd>Ctrl</kbd> + <kbd>C</kbd> để dừng máy chủ phát triển, và nhập lệnh terminal sau:

```bash
ember generate component-class todo-list
```

Lệnh này tạo lớp class thành phần mới `todomvc/app/components/todo-list.js`.

Điền vào file này bằng code sau, cho thấy dịch vụ `todo-data`, thông qua thuộc tính `todos`, cho mẫu của chúng ta. Điều này làm cho nó có thể truy cập thông qua `this.todos` bên trong cả lớp class và mẫu:

```js
import Component from "@glimmer/component";
import { inject as service } from "@ember/service";

export default class TodoListComponent extends Component {
  @service("todo-data") todos;
}
```

Một vấn đề ở đây là dịch vụ của chúng ta được gọi là `todos`, nhưng danh sách todos cũng được gọi là `todos`, vì vậy hiện tại chúng ta sẽ truy cập dữ liệu bằng `this.todos.todos`. Điều này không trực quan, vì vậy chúng ta sẽ thêm một [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) vào dịch vụ `todos` gọi là `all`, đại diện cho tất cả todos.

Để làm điều này, hãy quay lại file `todo-data.js` của bạn và thêm nội dung sau bên dưới dòng `@tracked todos = [];`:

```js
export default class TodoDataService extends Service {
  @tracked todos = [];

  get all() {
    return this.todos;
  }
  // …
}
```

Bây giờ chúng ta có thể truy cập dữ liệu bằng `this.todos.all`, trực quan hơn nhiều. Để áp dụng điều này, hãy đến thành phần `todo-list.hbs` của bạn và thay thế các lời gọi thành phần tĩnh:

```hbs
<Todo />
<Todo />
```

Bằng khối `#each` động (đây về cơ bản là đường cú pháp trên đầu [`forEach()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) của JavaScript) tạo ra một thành phần `<Todo />` cho mỗi todo có sẵn trong danh sách todos được trả về bởi getter `all()` của dịch vụ:

```hbs-nolint
\{{#each this.todos.all as |todo|}}
<Todo @todo=\{{todo}} />
\{{/each}}
```

Một cách khác để nhìn vào điều này:

- `this` — ngữ cảnh render / phiên bản thành phần.
- `todos` — thuộc tính trên `this`, mà chúng ta đã định nghĩa trong thành phần `todo-list.js` bằng cách sử dụng `@service('todo-data') todos;`. Đây là tham chiếu đến dịch vụ `todo-data`, cho phép chúng ta tương tác trực tiếp với phiên bản dịch vụ.
- `all` — getter trên dịch vụ `todo-data` trả về tất cả todos.

Hãy thử khởi động lại máy chủ và điều hướng đến ứng dụng, và bạn sẽ thấy nó hoạt động! Thực ra là gần như vậy. Mỗi khi bạn nhập mục Todo mới, một mục danh sách mới xuất hiện bên dưới input văn bản, nhưng thật không may nó luôn nói "Buy Movie Tickets".

Điều này là vì nhãn văn bản bên trong mỗi mục danh sách được mã hóa cứng thành văn bản đó, như được thấy trong `todo.hbs`:

```hbs
<label>Buy Movie Tickets</label>
```

Cập nhật dòng này để sử dụng Argument `@todo` — đại diện cho Todo mà chúng ta đã truyền vào thành phần này khi nó được gọi trong `todo-list.hbs`, trong dòng `<Todo @todo=\{{todo}} />`:

```hbs
<label>\{{@todo.text}}</label>
```

Được rồi, hãy thử lại. Bạn sẽ thấy rằng bây giờ văn bản được gửi trong `<input>` được phản ánh đúng trong UI:

![The app being shown in its final state of this article, with entered todo items being shown in the UI](todos-being-appended-with-correct-text.gif)

## Tóm tắt

Được rồi, đó là tiến trình tuyệt vời cho bây giờ. Chúng ta bây giờ có thể thêm các mục todo vào ứng dụng, và trạng thái dữ liệu được theo dõi bằng dịch vụ của chúng ta. Tiếp theo, chúng ta sẽ tiến đến việc làm cho chức năng footer hoạt động, bao gồm bộ đếm todo, và xem xét render có điều kiện, bao gồm việc tạo kiểu dáng đúng cho todos khi chúng đã được đánh dấu. Chúng ta cũng sẽ kết nối nút "Xóa đã hoàn thành".

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Ember_structure_componentization","Learn_web_development/Core/Frameworks_libraries/Ember_conditional_footer", "Learn_web_development/Core/Frameworks_libraries")}}
