---
title: Định tuyến trong Ember
slug: Learn_web_development/Core/Frameworks_libraries/Ember_routing
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Ember_conditional_footer","Learn_web_development/Core/Frameworks_libraries/Ember_resources", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài viết này, chúng ta tìm hiểu về **định tuyến**, hay còn được gọi là lọc dựa trên URL. Chúng ta sẽ sử dụng nó để cung cấp URL duy nhất cho mỗi trong số ba chế độ xem todo — "Tất cả", "Đang hoạt động" và "Đã hoàn thành".

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
      <td>Tìm hiểu về triển khai định tuyến trong Ember.</td>
    </tr>
  </tbody>
</table>

## Lọc dựa trên URL

Ember đi kèm với hệ thống định tuyến có tích hợp chặt chẽ với URL trình duyệt. Thông thường, khi viết ứng dụng web, bạn muốn trang được đại diện bởi URL để nếu (vì bất kỳ lý do gì), trang cần làm mới, người dùng không bị ngạc nhiên bởi trạng thái của ứng dụng web — họ có thể liên kết trực tiếp đến các chế độ xem quan trọng của ứng dụng.

Hiện tại, chúng ta đã có trang "Tất cả", vì chúng ta hiện không thực hiện bất kỳ lọc nào trong trang chúng ta đã làm việc với, nhưng chúng ta sẽ cần tổ chức lại một chút để xử lý chế độ xem khác nhau cho các todos "Đang hoạt động" và "Đã hoàn thành".

Một ứng dụng Ember có tuyến đường "application" mặc định, được liên kết với mẫu `app/templates/application.hbs`. Vì mẫu application đó là điểm vào của ứng dụng todo, chúng ta sẽ cần thực hiện một số thay đổi để cho phép định tuyến.

## Tạo các tuyến đường

Hãy bắt đầu bằng cách tạo ba tuyến đường mới: "Index", "Active" và "Completed". Để làm điều này, bạn sẽ cần nhập các lệnh sau vào terminal, trong thư mục gốc của ứng dụng:

```bash
ember generate route index
ember generate route completed
ember generate route active
```

Lệnh thứ hai và thứ ba không chỉ tạo các file mới, mà còn cập nhật file hiện có, `app/router.js`. Nó chứa nội dung sau:

```js
import EmberRouter from "@ember/routing/router";
import config from "./config/environment";

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route("completed");
  this.route("active");
});
```

Các dòng được tô sáng đã được thêm khi các lệnh thứ 2 và thứ 3 ở trên được chạy.

`router.js` hoạt động như "bản đồ trang web" cho các nhà phát triển để có thể nhanh chóng thấy toàn bộ ứng dụng được cấu trúc như thế nào. Nó cũng cho Ember biết cách tương tác với tuyến đường của bạn, chẳng hạn như khi tải dữ liệu tùy ý, xử lý lỗi trong khi tải dữ liệu đó, hoặc diễn giải các đoạn động của URL. Vì dữ liệu của chúng ta là tĩnh, chúng ta sẽ không đến được các tính năng phức tạp đó, nhưng chúng ta vẫn sẽ đảm bảo rằng tuyến đường cung cấp dữ liệu tối thiểu cần thiết để xem trang.

Tạo tuyến đường "Index" không thêm dòng định nghĩa tuyến đường vào `router.js`, vì giống như với điều hướng URL và tải mô-đun JavaScript, "Index" là một từ đặc biệt biểu thị tuyến đường mặc định để render, tải, v.v.

Để điều chỉnh cách cũ của chúng ta render ứng dụng TodoList, trước tiên chúng ta cần thay thế lời gọi thành phần TodoList từ mẫu application bằng lời gọi `\{{outlet}}`, có nghĩa là "bất kỳ tuyến đường con nào sẽ được render ở đây".

Hãy đến file `todomvc/app/templates/application.hbs` và thay thế

```hbs
<TodoList />
```

Bằng

```hbs
\{{outlet}}
```

Tiếp theo, trong các mẫu `index.hbs`, `completed.hbs` và `active.hbs` (cũng được tìm thấy trong thư mục templates) chúng ta có thể bây giờ chỉ cần nhập lời gọi thành phần TodoList.

Trong mỗi trường hợp, hãy thay thế

```hbs
\{{outlet}}
```

bằng

```hbs
<TodoList />
```

Vì vậy, tại thời điểm này, nếu bạn thử ứng dụng lại và truy cập bất kỳ ba tuyến đường nào

`localhost:4200 localhost:4200/active localhost:4200/completed`

bạn sẽ thấy chính xác điều tương tự. Tại mỗi URL, mẫu tương ứng với đường dẫn cụ thể ("Active", "Completed" hoặc "Index"), sẽ render thành phần `<TodoList />`. Vị trí trong trang mà `<TodoList />` được render được xác định bởi `\{{ outlet }}` bên trong tuyến đường cha, trong trường hợp này là `application.hbs`. Vì vậy, chúng ta đã có các tuyến đường. Tuyệt!

Nhưng bây giờ chúng ta cần một cách để phân biệt giữa mỗi tuyến đường này, để chúng hiển thị những gì chúng nên hiển thị.

Trước tiên, hãy quay lại file `todo-data.js` một lần nữa. Nó đã chứa getter trả về tất cả todos và getter trả về todos chưa hoàn thành. Getter còn thiếu là getter để chỉ trả về các todos đã hoàn thành. Hãy thêm nội dung sau bên dưới các getter hiện có:

```js
export default class TodoDataService extends Service {
  // …
  get completed() {
    return this.todos.filter((todo) => todo.isCompleted);
  }
  // …
}
```

## Model

Bây giờ chúng ta cần thêm model vào các file JavaScript tuyến đường để cho phép chúng ta dễ dàng trả về các tập dữ liệu cụ thể để hiển thị trong các model đó. `model` là hook vòng đời tải dữ liệu. Đối với TodoMVC, các khả năng của model không quá quan trọng với chúng ta; bạn có thể tìm thêm thông tin trong [hướng dẫn model Ember](https://guides.emberjs.com/release/routing/specifying-a-routes-model/) nếu bạn muốn tìm hiểu sâu hơn. Chúng ta cũng cung cấp quyền truy cập vào dịch vụ, giống như chúng ta đã làm cho các thành phần.

### Model tuyến đường Index

Trước tiên, hãy cập nhật `todomvc/app/routes/index.js` để trông như sau:

```js
import Route from "@ember/routing/route";
import { inject as service } from "@ember/service";

export default class IndexRoute extends Route {
  @service("todo-data") todos;

  model() {
    let todos = this.todos;

    return {
      get allTodos() {
        return todos.all;
      },
    };
  }
}
```

Bây giờ chúng ta có thể cập nhật file `todomvc/app/templates/index.hbs` để khi nó bao gồm thành phần `<TodoList />`, nó làm vậy một cách tường minh với model có sẵn, gọi getter `allTodos()` của nó để đảm bảo tất cả các todos đều được hiển thị.

Trong file này, hãy thay đổi

```hbs
<TodoList />
```

Thành

```hbs-nolint
<TodoList @todos=\{{ @model.allTodos }} />
```

### Model tuyến đường Completed

Bây giờ hãy cập nhật `todomvc/app/routes/completed.js` để trông như sau:

```js
import Route from "@ember/routing/route";
import { inject as service } from "@ember/service";

export default class CompletedRoute extends Route {
  @service("todo-data") todos;

  model() {
    let todos = this.todos;

    return {
      get completedTodos() {
        return todos.completed;
      },
    };
  }
}
```

Bây giờ chúng ta có thể cập nhật file `todomvc/app/templates/completed.hbs` để khi nó bao gồm thành phần `<TodoList />`, nó làm vậy một cách tường minh với model có sẵn, gọi getter `completedTodos()` của nó để đảm bảo chỉ các todos đã hoàn thành mới được hiển thị.

Trong file này, hãy thay đổi

```hbs
<TodoList />
```

Thành

```hbs-nolint
<TodoList @todos=\{{ @model.completedTodos }} />
```

### Model tuyến đường Active

Cuối cùng cho các tuyến đường, hãy sắp xếp tuyến đường active của chúng ta. Bắt đầu bằng cách cập nhật `todomvc/app/routes/active.js` để trông như sau:

```js
import Route from "@ember/routing/route";
import { inject as service } from "@ember/service";

export default class ActiveRoute extends Route {
  @service("todo-data") todos;

  model() {
    let todos = this.todos;

    return {
      get activeTodos() {
        return todos.incomplete;
      },
    };
  }
}
```

Bây giờ chúng ta có thể cập nhật file `todomvc/app/templates/active.hbs` để khi nó bao gồm thành phần `<TodoList />`, nó làm vậy một cách tường minh với model có sẵn, gọi getter `activeTodos()` của nó để đảm bảo chỉ các todos đang hoạt động (chưa hoàn thành) mới được hiển thị.

Trong file này, hãy thay đổi

```hbs
<TodoList />
```

Thành

```hbs-nolint
<TodoList @todos=\{{ @model.activeTodos }} />
```

Lưu ý rằng, trong mỗi hook model tuyến đường, chúng ta trả về một đối tượng với getter thay vì đối tượng tĩnh, hoặc chỉ danh sách todos tĩnh (ví dụ, `this.todos.completed`). Lý do cho điều này là chúng ta muốn mẫu có tham chiếu động đến danh sách todo, và nếu chúng ta trả về danh sách trực tiếp, dữ liệu sẽ không bao giờ được tính toán lại, điều này sẽ khiến việc điều hướng có vẻ thất bại / không thực sự lọc. Bằng cách có getter được định nghĩa trong đối tượng trả về từ dữ liệu model, todos được tra cứu lại để các thay đổi của chúng ta đối với danh sách todo được thể hiện trong danh sách được render.

## Làm cho các liên kết footer hoạt động

Vì vậy, chức năng tuyến đường của chúng ta bây giờ đã hoàn toàn được đặt, nhưng chúng ta không thể truy cập chúng từ ứng dụng. Hãy làm cho các liên kết footer hoạt động để khi nhấp vào chúng sẽ đến các tuyến đường mong muốn.

Hãy quay lại `todomvc/app/components/footer.hbs` và tìm phần đánh dấu sau:

```hbs
<a href="#">All</a>
<a href="#">Active</a>
<a href="#">Completed</a>
```

Hãy cập nhật nó thành

```hbs
<LinkTo @route="index">All</LinkTo>
<LinkTo @route="active">Active</LinkTo>
<LinkTo @route="completed">Completed</LinkTo>
```

`<LinkTo>` là thành phần Ember tích hợp xử lý tất cả các thay đổi trạng thái khi điều hướng tuyến đường, cũng như thiết lập class "active" trên bất kỳ liên kết nào khớp với URL, trong trường hợp có mong muốn tạo kiểu dáng nó khác với các liên kết không hoạt động.

## Cập nhật hiển thị todos bên trong TodoList

Một điều nhỏ cuối cùng mà chúng ta cần sửa là trước đây, bên trong `todomvc/app/components/todo-list.hbs`, chúng ta đang truy cập dịch vụ todo-data trực tiếp và lặp qua tất cả todos, như được hiển thị ở đây:

```hbs
\{{#each this.todos.all as |todo| }}
```

Vì bây giờ chúng ta muốn thành phần TodoList hiển thị danh sách được lọc, chúng ta sẽ muốn truyền đối số cho thành phần TodoList đại diện cho "danh sách todos hiện tại", như được hiển thị ở đây:

```hbs
\{{#each @todos as |todo| }}
```

Và đó là tất cả cho hướng dẫn này! Ứng dụng của bạn bây giờ phải có các liên kết footer hoạt động đầy đủ hiển thị tuyến đường "Index"/mặc định, "Active" và "Completed".

![The todo list app, showing the routing working for all, active, and completed todos.](todos-navigation.gif)

## Tóm tắt

Chúc mừng! Bạn đã hoàn thành hướng dẫn này!

Còn rất nhiều thứ cần triển khai trước khi những gì chúng ta đã đề cập ở đây có tính ngang bằng với [ứng dụng TodoMVC](https://todomvc.com/) gốc, chẳng hạn như chỉnh sửa, xóa và lưu trữ todos qua các lần tải lại trang.

Để xem triển khai Ember đã hoàn thiện của chúng ta, hãy kiểm tra thư mục ứng dụng đã hoàn thiện trong kho lưu trữ cho [code của hướng dẫn này](https://github.com/NullVoxPopuli/ember-todomvc-tutorial/tree/master/steps/00-finished-todomvc/todomvc) hoặc xem [phiên bản được triển khai trực tiếp](https://nullvoxpopuli.github.io/ember-todomvc-tutorial/) ở đây. Nghiên cứu code để tìm hiểu thêm về Ember, và cũng xem bài viết tiếp theo, cung cấp các liên kết đến nhiều tài nguyên hơn và một số lời khuyên khắc phục sự cố.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Ember_conditional_footer","Learn_web_development/Core/Frameworks_libraries/Ember_resources", "Learn_web_development/Core/Frameworks_libraries")}}
