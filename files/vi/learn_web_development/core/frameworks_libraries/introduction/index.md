---
title: Giới thiệu về framework phía client
short-title: Giới thiệu
slug: Learn_web_development/Core/Frameworks_libraries/Introduction
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Main_features", "Learn_web_development/Core/Frameworks_libraries")}}

Chúng tôi bắt đầu tìm hiểu về framework với một cái nhìn tổng quan chung về lĩnh vực này, xem xét lịch sử ngắn gọn về JavaScript và framework, tại sao framework tồn tại và chúng mang lại cho chúng ta điều gì, cách bắt đầu suy nghĩ về việc chọn framework để học, và những giải pháp thay thế nào tồn tại cho framework phía client.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a> và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Code của bên thứ ba là gì và cách các framework JavaScript phía client ra đời.</li>
          <li>Những vấn đề mà framework giải quyết, những giải pháp thay thế nào tồn tại và cách chọn một framework.</li>
          <li>Sự khác biệt giữa thư viện và framework.</li>
          <li>Khi nào nên và không nên sử dụng framework.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Sự xuất hiện của thư viện và framework

Khi JavaScript ra mắt vào năm 1996, nó đã thêm tính tương tác và sự thú vị không thường xuyên vào web mà cho đến lúc đó chỉ gồm các tài liệu tĩnh. Web đã không còn chỉ là nơi để _đọc_, mà còn để _làm_ mọi thứ. Sự phổ biến của JavaScript tăng đều đặn. Các nhà phát triển làm việc với JavaScript đã viết các công cụ để giải quyết những vấn đề họ gặp phải, và đóng gói chúng thành các gói có thể tái sử dụng gọi là **thư viện**, để họ có thể chia sẻ giải pháp của mình với người khác. Hệ sinh thái chia sẻ thư viện này đã giúp định hình sự phát triển của web, và cuối cùng đã mở đường cho các framework.

Một **framework** là một thư viện cung cấp ý kiến về cách phần mềm được xây dựng. Những ý kiến này cho phép sự có thể dự đoán và đồng nhất trong một ứng dụng; tính có thể dự đoán cho phép phần mềm mở rộng đến quy mô khổng lồ và vẫn có thể bảo trì; tính có thể dự đoán và bảo trì là cần thiết cho sức khỏe và tuổi thọ của phần mềm. Sự ra đời của các framework JavaScript hiện đại đã giúp xây dựng các ứng dụng tương tác, linh động cao dễ dàng hơn nhiều.

Các framework JavaScript cung cấp sức mạnh cho phần lớn phần mềm ấn tượng trên web hiện đại — bao gồm nhiều trang web mà bạn có thể sử dụng mỗi ngày.

## Có những framework nào hiện có?

Có rất nhiều framework hiện có, nhưng hiện nay "bốn ông lớn" được coi là sau đây.

### Ember

[Ember](https://emberjs.com/) được phát hành ban đầu vào tháng 12 năm 2011 như là sự tiếp nối công việc bắt đầu trong dự án [SproutCore](https://en.wikipedia.org/wiki/SproutCore). Đây là một framework cũ hơn có ít người dùng hơn so với các lựa chọn hiện đại như React và Vue, nhưng nó vẫn được ưa chuộng khá nhiều nhờ tính ổn định, hỗ trợ cộng đồng và một số nguyên tắc lập trình thông minh.

### Angular

[Angular](https://angular.dev/) là một framework ứng dụng web mã nguồn mở được dẫn dắt bởi nhóm Angular tại Google và bởi một cộng đồng cá nhân và doanh nghiệp. Đây là một bản viết lại hoàn toàn từ cùng một nhóm đã xây dựng [AngularJS](https://angularjs.org/). Angular được phát hành chính thức vào ngày 14 tháng 9 năm 2016.

Angular là một framework dựa trên thành phần sử dụng các mẫu HTML khai báo. Tại thời điểm xây dựng, không để lộ cho các nhà phát triển, trình biên dịch của framework chuyển đổi các mẫu thành các lệnh JavaScript được tối ưu hóa. Angular sử dụng [TypeScript](https://www.typescriptlang.org/), một tập hợp mở rộng của JavaScript mà chúng ta sẽ xem xét kỹ hơn trong chương tiếp theo.

### Vue

Sau khi làm việc và học hỏi từ dự án [AngularJS](https://angularjs.org/) gốc, Evan You đã phát hành [Vue](https://vuejs.org/) vào năm 2014. Vue là framework trẻ nhất trong bốn ông lớn, nhưng đã trải qua sự tăng vọt gần đây về độ phổ biến.

Vue, giống như [AngularJS](https://angularjs.org/), mở rộng HTML với một số code của riêng nó. Ngoài ra, nó chủ yếu dựa trên JavaScript tiêu chuẩn hiện đại.

### React

Facebook đã phát hành [React](https://react.dev/) vào năm 2013. Đến thời điểm đó, họ đã sử dụng React để giải quyết nhiều vấn đề nội bộ của mình. Về mặt kỹ thuật, bản thân React _không phải_ là framework; đó là thư viện để kết xuất các thành phần giao diện người dùng. React được sử dụng kết hợp với _các_ thư viện khác để tạo ứng dụng — React và [React Native](https://reactnative.dev/) cho phép các nhà phát triển tạo ứng dụng di động; React và [ReactDOM](https://react.dev/reference/react-dom) cho phép họ tạo ứng dụng web, v.v.

Vì React và ReactDOM thường được sử dụng cùng nhau, React thường được hiểu thông thường là một framework JavaScript. Khi bạn đọc qua module này, chúng tôi sẽ làm việc với sự hiểu biết thông thường đó.

React mở rộng JavaScript với cú pháp giống HTML, được gọi là [JSX](https://react.dev/learn/writing-markup-with-jsx).

## Tại sao framework tồn tại?

Chúng ta đã thảo luận về môi trường đã truyền cảm hứng cho việc tạo ra framework, nhưng không thực sự _tại sao_ các nhà phát triển cảm thấy cần tạo ra chúng. Khám phá lý do tại sao đòi hỏi trước tiên phải xem xét những thách thức của phát triển phần mềm.

Hãy xem xét một loại ứng dụng phổ biến: Một ứng dụng tạo danh sách việc cần làm, mà chúng ta sẽ xem xét triển khai bằng nhiều framework trong các chương sau. Ứng dụng này nên cho phép người dùng thực hiện những việc như kết xuất danh sách tác vụ, thêm tác vụ mới và xóa tác vụ; và nó phải làm điều này trong khi theo dõi và cập nhật đáng tin cậy dữ liệu cơ bản của ứng dụng. Trong phát triển phần mềm, dữ liệu cơ bản này được gọi là trạng thái.

Mỗi mục tiêu của chúng ta về mặt lý thuyết đơn giản khi tách biệt. Chúng ta có thể lặp qua dữ liệu để kết xuất nó; chúng ta có thể thêm vào một đối tượng để tạo tác vụ mới; chúng ta có thể sử dụng một định danh để tìm, chỉnh sửa hoặc xóa tác vụ. Khi chúng ta nhớ rằng ứng dụng phải cho phép người dùng thực hiện _tất cả_ những điều này qua trình duyệt, một số vấn đề bắt đầu xuất hiện. **Vấn đề thực sự là: mỗi khi chúng ta thay đổi trạng thái của ứng dụng, chúng ta cần cập nhật giao diện người dùng để phù hợp.**

Chúng ta có thể kiểm tra độ khó của vấn đề này bằng cách xem xét chỉ _một_ tính năng của ứng dụng danh sách việc cần làm: kết xuất danh sách tác vụ.

## Sự phức tạp của các thay đổi DOM

Xây dựng các phần tử HTML và kết xuất chúng trong trình duyệt vào thời điểm thích hợp đòi hỏi một lượng code đáng ngạc nhiên. Giả sử trạng thái của chúng ta là một kho lưu trữ khóa-giá trị chứa `taskName` (được kiểm soát bởi đầu vào văn bản) và danh sách các `tasks`:

```js
const state = {
  taskName: "",
  tasks: [
    {
      id: "todo-0",
      name: "Learn some frameworks!",
    },
  ],
};
```

Làm thế nào chúng ta hiển thị một trong những tác vụ đó cho người dùng? Chúng ta muốn biểu diễn mỗi tác vụ như một mục danh sách — một phần tử HTML [`<li>`](/en-US/docs/Web/HTML/Reference/Elements/li) bên trong một phần tử danh sách không có thứ tự (một [`<ul>`](/en-US/docs/Web/HTML/Reference/Elements/ul)). Làm thế nào để tạo ra nó? Điều đó có thể trông như thế này:

```js
function buildTodoItemEl(id, name) {
  const item = document.createElement("li");
  const span = document.createElement("span");

  span.textContent = name;

  item.id = id;
  item.appendChild(span);
  item.appendChild(buildDeleteButtonEl(id));

  return item;
}
```

Ở đây, chúng ta sử dụng phương thức [`document.createElement()`](/en-US/docs/Web/API/Document/createElement) để tạo `<li>` của chúng ta, và vài dòng code khác để tạo các thuộc tính và phần tử con mà nó cần.

Đoạn code trước tham chiếu đến một hàm xây dựng khác: `buildDeleteButtonEl()`. Nó tuân theo mẫu tương tự như cái chúng ta đã sử dụng để xây dựng một phần tử mục danh sách:

```js
function buildDeleteButtonEl(id) {
  const button = document.createElement("button");
  button.setAttribute("type", "button");
  button.addEventListener("click", () => {
    state.tasks = state.tasks.filter((t) => t.id !== id);
    renderTodoList();
  });
  button.textContent = "Delete";

  return button;
}
```

Phần thú vị cần lưu ý là mỗi lần chúng ta cập nhật trạng thái, chúng ta cần gọi thủ công `renderTodoList` để trạng thái của chúng ta được đồng bộ với màn hình. Code sẽ kết xuất các mục của chúng ta trên trang có thể trông như thế này:

```js hidden
const todoFormEl = document.querySelector("#todo-form");
const todoInputEl = document.querySelector("#todo-input");
const todoListEl = document.querySelector("#todo-list");
```

```js
function renderTodoList() {
  const frag = document.createDocumentFragment();
  state.tasks.forEach((task) => {
    const item = buildTodoItemEl(task.id, task.name);
    frag.appendChild(item);
  });

  while (todoListEl.lastChild) {
    todoListEl.removeChild(todoListEl.lastChild);
  }
  todoListEl.appendChild(frag);
}
```

Bây giờ chúng ta có gần ba mươi dòng code dành riêng cho giao diện người dùng — _chỉ_ để kết xuất thứ gì đó trong DOM — và không có điểm nào chúng ta thêm các lớp mà chúng ta có thể sử dụng sau này để tạo kiểu cho các mục danh sách của mình!

Nếu bạn tò mò, chúng tôi có một bản demo chạy đầy đủ bên dưới. Bạn có thể nhấp vào nút "Play" để xem code nguồn trong playground.

```html hidden
<h1>TodoMatic</h1>
<form id="todo-form">
  <label for="todo-input">What needs to be done?</label>
  <input type="text" id="todo-input" autocomplete="on" />
  <button type="submit">Add</button>
</form>
<ul id="todo-list"></ul>
```

```css hidden
* + * {
  margin-top: 0.4rem;
}

html {
  font-size: 62.5%;
}

body {
  font-size: 2rem;
  line-height: 1.25;
  font-family:
    -apple-system, BlinkMacSystemFont, "Segoe UI", "Apple Color Emoji",
    "Segoe UI Emoji", "Segoe UI Symbol", "Roboto", "Helvetica", "Arial",
    sans-serif;
  color: hsl(0 0 0.13);

  width: 95%;
  max-width: 30em;
  padding-bottom: 2em;
  margin: 0 auto;
}

button,
input[type="text"] {
  font-size: 100%;
  line-height: 1.15;
  font-family: inherit;
  margin: 0;

  padding: 0.5rem;
  border: 1px solid #707070;
  border-radius: 2px;
}

* + button {
  margin-left: 0.4rem;
}

label {
  display: table;
}

ul {
  margin-top: 1.6rem;
  padding-left: 2em;
}

label + input[type="text"] {
  margin-top: 0.4rem;
}
```

```js hidden
function generateUniqueId(prefix = "prefix") {
  return `${prefix}-${Math.floor(Math.random() * Date.now())}`;
}

function createTask(name) {
  return {
    name,
    id: generateUniqueId("todo"),
  };
}

function renderInput() {
  todoInputEl.value = state.taskName;
}

todoInputEl.addEventListener("change", (e) => {
  state.taskName = e.target.value;
});
todoFormEl.addEventListener("submit", (e) => {
  e.preventDefault();
  state.tasks = [...state.tasks, createTask(state.taskName)];
  state.taskName = "";
  renderInput();
  renderTodoList();
});
renderInput();
renderTodoList();
```

{{EmbedLiveSample("the_verbosity_of_dom_change", "", "400", , , , , "allow-forms")}}

Làm việc trực tiếp với DOM, như trong ví dụ này, đòi hỏi hiểu biết về nhiều thứ về cách DOM hoạt động: cách tạo phần tử; cách thay đổi các thuộc tính của chúng; cách đặt phần tử bên trong nhau; cách đưa chúng lên trang. Không có code nào trong số này thực sự xử lý tương tác người dùng, hay giải quyết việc thêm hoặc xóa tác vụ. Nếu chúng ta thêm những tính năng đó, chúng ta phải nhớ cập nhật giao diện người dùng vào đúng thời điểm và đúng cách.

Các framework JavaScript được tạo ra để làm cho loại công việc này dễ dàng hơn nhiều — chúng tồn tại để cung cấp trải nghiệm nhà phát triển tốt hơn. Chúng không mang lại sức mạnh mới cho JavaScript; chúng cho bạn quyền truy cập dễ dàng hơn vào sức mạnh của JavaScript để bạn có thể xây dựng cho web ngày nay.

Đọc thêm về các tính năng JavaScript được sử dụng trong phần này:

- [`Array.forEach()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)
- [`Document.createDocumentFragment()`](/en-US/docs/Web/API/Document/createDocumentFragment)
- [`Document.createElement()`](/en-US/docs/Web/API/Document/createElement)
- [`Element.setAttribute()`](/en-US/docs/Web/API/Element/setAttribute)
- [`Node.appendChild()`](/en-US/docs/Web/API/Node/appendChild)
- [`Node.removeChild()`](/en-US/docs/Web/API/Node/removeChild)
- [`Node.textContent`](/en-US/docs/Web/API/Node/textContent)

## Một cách khác để xây dựng giao diện người dùng

Mỗi framework JavaScript cung cấp cách viết giao diện người dùng theo cách _khai báo_ hơn. Nghĩa là, chúng cho phép bạn viết code mô tả giao diện người dùng của bạn trông như thế nào, và framework làm cho điều đó xảy ra trong DOM đằng sau.

Cách tiếp cận JavaScript thuần túy để xây dựng các phần tử DOM mới liên tục khó hiểu khi nhìn qua. Ngược lại, đoạn code sau minh họa cách bạn có thể sử dụng Vue để mô tả danh sách tác vụ của chúng ta:

```html
<ul>
  <li v-for="task in tasks" v-bind:key="task.id">
    <span>\{{task.name}}</span>
    <button type="button">Delete</button>
  </li>
</ul>
```

Đó là tất cả. Đoạn code này giảm gần ba mươi dòng code xuống còn sáu dòng. Nếu dấu ngoặc nhọn và các thuộc tính `v-` ở đây không quen thuộc với bạn, đó là ổn; bạn sẽ học về cú pháp Vue cụ thể sau trong module. Điều cần rút ra ở đây là code này trông giống như giao diện người dùng mà nó đại diện, trong khi code JavaScript thuần túy thì không.

Nhờ Vue, chúng ta không phải tự viết các hàm để xây dựng giao diện người dùng; framework sẽ xử lý điều đó cho chúng ta theo cách tối ưu và hiệu quả. Vai trò duy nhất của chúng ta ở đây là mô tả cho Vue cách mỗi mục trông như thế nào. Các nhà phát triển quen thuộc với Vue có thể nhanh chóng hiểu ra những gì đang xảy ra khi họ tham gia dự án của chúng ta. Vue không phải là duy nhất trong việc này: sử dụng framework cải thiện cả hiệu quả nhóm và cá nhân.

Có thể làm những thứ _tương tự_ như thế này trong JavaScript thuần túy. [Chuỗi mẫu ký tự](/en-US/docs/Web/JavaScript/Reference/Template_literals) giúp dễ dàng viết các chuỗi HTML đại diện cho phần tử cuối cùng trông như thế nào. Điều đó có thể là một ý tưởng hữu ích cho thứ gì đó đơn giản như ứng dụng danh sách việc cần làm của chúng ta, nhưng nó không thể bảo trì cho các ứng dụng lớn quản lý hàng nghìn bản ghi dữ liệu, và có thể kết xuất nhiều phần tử duy nhất trong giao diện người dùng.

## Những thứ khác mà framework mang lại cho chúng ta

Hãy xem xét một số ưu điểm khác mà framework cung cấp. Như chúng ta đã đề cập trước đây, những ưu điểm của framework có thể đạt được trong JavaScript thuần túy, nhưng sử dụng framework loại bỏ toàn bộ gánh nặng nhận thức của việc phải tự giải quyết những vấn đề này.

### Công cụ

Vì mỗi framework trong module này có một cộng đồng lớn, hoạt động, hệ sinh thái của mỗi framework cung cấp công cụ cải thiện trải nghiệm nhà phát triển. Những công cụ này giúp dễ dàng thêm những thứ như kiểm thử (để đảm bảo ứng dụng của bạn hoạt động như mong đợi) hoặc linting (để đảm bảo code của bạn không có lỗi và nhất quán về mặt phong cách).

> [!NOTE]
> Nếu bạn muốn tìm hiểu thêm chi tiết về các khái niệm công cụ web, hãy xem [Tổng quan về công cụ phía client](/en-US/docs/Learn_web_development/Extensions/Client-side_tools/Overview) của chúng tôi.

### Phân chia thành phần

Hầu hết các framework lớn khuyến khích các nhà phát triển trừu tượng hóa các phần khác nhau trong giao diện người dùng của họ thành _thành phần_ — các đoạn code có thể bảo trì, tái sử dụng có thể giao tiếp với nhau. Tất cả code liên quan đến một thành phần nhất định có thể nằm trong một tệp (hoặc một vài tệp cụ thể) để bạn với tư cách là nhà phát triển biết chính xác nơi cần đến để thực hiện thay đổi cho thành phần đó. Trong một ứng dụng JavaScript thuần túy, bạn sẽ phải tạo bộ quy ước của riêng mình để đạt được điều này một cách hiệu quả, có thể mở rộng. Nhiều nhà phát triển JavaScript, nếu để tự do, có thể kết thúc với tất cả code liên quan đến một phần của giao diện người dùng trải rải rác khắp nơi trong một tệp — hoặc trong một tệp hoàn toàn khác.

### Định tuyến

Tính năng thiết yếu nhất của web là nó cho phép người dùng điều hướng từ trang này sang trang khác — xét cho cùng, đó là một mạng lưới các tài liệu liên kết với nhau. Khi bạn theo dõi một liên kết trên trang web này, trình duyệt của bạn giao tiếp với máy chủ và lấy nội dung mới để hiển thị cho bạn. Khi nó làm vậy, URL trong thanh địa chỉ của bạn thay đổi. Bạn có thể lưu URL mới này và quay lại trang đó sau, hoặc chia sẻ nó với người khác để họ có thể dễ dàng tìm thấy cùng một trang. Trình duyệt của bạn nhớ lịch sử điều hướng của bạn và cho phép bạn điều hướng qua lại, cũng vậy. Điều này được gọi là **định tuyến phía máy chủ**.

Các ứng dụng web hiện đại thường không tải và kết xuất các tệp HTML mới — chúng tải một vỏ HTML đơn lẻ, và liên tục cập nhật DOM bên trong nó (được gọi là **ứng dụng trang đơn**, hoặc **SPA**) mà không điều hướng người dùng đến các địa chỉ mới trên web. Mỗi trang giả mới thường được gọi là _view_, và theo mặc định, không có định tuyến nào được thực hiện.

Khi một SPA đủ phức tạp và kết xuất đủ nhiều view duy nhất, điều quan trọng là phải đưa chức năng định tuyến vào ứng dụng của bạn. Mọi người quen với việc có thể liên kết đến các trang cụ thể trong ứng dụng, di chuyển tiến và lùi trong lịch sử điều hướng của họ, v.v., và trải nghiệm của họ bị ảnh hưởng khi các tính năng web tiêu chuẩn này bị gián đoạn. Khi định tuyến được xử lý bởi ứng dụng client theo cách này, nó được gọi đúng là **định tuyến phía client**.

Có thể tạo một router bằng các khả năng gốc của JavaScript và trình duyệt, nhưng các framework được phát triển tích cực, phổ biến có các thư viện đồng hành làm cho định tuyến trở thành một phần trực quan hơn của quá trình phát triển.

## Những điều cần cân nhắc khi sử dụng framework

Trở thành một nhà phát triển web hiệu quả có nghĩa là sử dụng các công cụ phù hợp nhất cho công việc. Các framework JavaScript làm cho việc phát triển ứng dụng front-end dễ dàng, nhưng chúng không phải là viên đạn bạc sẽ giải quyết mọi vấn đề. Phần này nói về một số điều bạn nên cân nhắc khi sử dụng framework. Hãy nhớ rằng bạn có thể không cần một framework — hãy cảnh giác để không kết thúc việc sử dụng framework chỉ vì nó.

### Quen thuộc với công cụ

Giống như JavaScript thuần túy, framework mất thời gian để học và có những đặc điểm riêng. Trước khi quyết định sử dụng một framework cho dự án, hãy chắc chắn bạn có thời gian để học đủ các tính năng của nó để nó hữu ích cho bạn thay vì chống lại bạn, và hãy chắc chắn rằng đồng nghiệp của bạn cũng cảm thấy thoải mái với nó.

### Kỹ thuật quá mức

Nếu dự án phát triển web của bạn là một danh mục cá nhân với một vài trang, và những trang đó có ít hoặc không có khả năng tương tác, thì một framework (và tất cả JavaScript của nó) có thể không cần thiết chút nào. Điều đó nói, framework không phải là nguyên khối, và một số trong chúng phù hợp hơn cho các dự án nhỏ so với các dự án khác. Trong một bài viết cho Smashing Magazine, Sarah Drasner viết về cách [Vue có thể thay thế jQuery](https://www.smashingmagazine.com/2018/02/jquery-vue-javascript/) như một công cụ để làm cho các phần nhỏ của trang web tương tác.

### Cơ sở code lớn hơn và trừu tượng hóa

Các framework cho phép bạn viết code khai báo hơn — và đôi khi _ít_ code hơn nhìn chung — bằng cách xử lý các tương tác DOM cho bạn, đằng sau hậu trường. Sự trừu tượng hóa này tuyệt vời cho trải nghiệm của bạn với tư cách là nhà phát triển, nhưng nó không miễn phí. Để dịch những gì bạn viết thành các thay đổi DOM, framework phải chạy code của riêng mình, điều này làm cho phần mềm cuối cùng của bạn lớn hơn và tốn kém hơn về mặt tính toán để vận hành.

Một số code thêm là không thể tránh khỏi, và một framework hỗ trợ tree-shaking (loại bỏ bất kỳ code nào không thực sự được sử dụng trong ứng dụng trong quá trình xây dựng) sẽ cho phép bạn giữ ứng dụng nhỏ, nhưng đây vẫn là yếu tố bạn cần ghi nhớ khi xem xét hiệu suất của ứng dụng, đặc biệt trên các thiết bị bị hạn chế mạng/lưu trữ hơn, như điện thoại di động.

Sự trừu tượng hóa của framework ảnh hưởng không chỉ đến JavaScript của bạn, mà còn đến mối quan hệ của bạn với bản chất của web. Dù bạn xây dựng cho web theo cách nào, kết quả cuối cùng, lớp mà người dùng của bạn cuối cùng tương tác, là HTML. Viết toàn bộ ứng dụng bằng JavaScript có thể khiến bạn mất cái nhìn về HTML và mục đích của các thẻ khác nhau của nó, và dẫn bạn đến việc tạo ra một tài liệu HTML không có ngữ nghĩa và không thể tiếp cận. Thực ra, có thể viết một ứng dụng mong manh phụ thuộc hoàn toàn vào JavaScript và sẽ không hoạt động nếu không có nó.

Các framework không phải là nguồn gốc của vấn đề của chúng ta. Với các ưu tiên sai, bất kỳ ứng dụng nào cũng có thể mong manh, cồng kềnh và không thể tiếp cận. Tuy nhiên, framework làm khuếch đại các ưu tiên của chúng ta với tư cách là nhà phát triển. Nếu ưu tiên của bạn là tạo một ứng dụng web phức tạp, việc đó thật dễ dàng. Tuy nhiên, nếu các ưu tiên của bạn không cẩn thận bảo vệ hiệu suất và khả năng tiếp cận, framework sẽ khuếch đại sự mong manh, cồng kềnh và không thể tiếp cận của bạn. Các ưu tiên nhà phát triển hiện đại, được khuếch đại bởi framework, đã đảo ngược cấu trúc của web ở nhiều nơi. Thay vì một mạng lưới tài liệu mạnh mẽ, ưu tiên nội dung, web hiện nay thường đặt JavaScript lên đầu và trải nghiệm người dùng xuống cuối.

## Khả năng tiếp cận trên web điều khiển bởi framework

Hãy xây dựng trên những gì chúng ta đã nói trong phần trước, và nói thêm một chút về khả năng tiếp cận. Làm cho giao diện người dùng có thể tiếp cận luôn đòi hỏi một số suy nghĩ và nỗ lực, và framework có thể làm phức tạp quá trình đó. Bạn thường phải sử dụng các API framework nâng cao để truy cập các tính năng trình duyệt gốc như [vùng trực tiếp](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) ARIA hoặc quản lý tiêu điểm.

Trong một số trường hợp, các ứng dụng framework tạo ra các rào cản khả năng tiếp cận không tồn tại cho các trang web truyền thống. Ví dụ lớn nhất về điều này là trong định tuyến phía client, như đã đề cập trước đây.

Với định tuyến (phía máy chủ) truyền thống, điều hướng web có kết quả có thể dự đoán. Trình duyệt biết cần đặt tiêu điểm vào đầu trang và công nghệ hỗ trợ sẽ thông báo tiêu đề của trang. Những điều này xảy ra mỗi khi bạn điều hướng đến một trang mới.

Với định tuyến phía client, trình duyệt của bạn không tải các trang web mới, vì vậy nó không biết rằng nó nên tự động điều chỉnh tiêu điểm hoặc thông báo tiêu đề trang mới. Các tác giả framework đã dành thời gian và công sức khổng lồ để viết JavaScript tái tạo các tính năng này, và thậm chí như vậy, không có framework nào đã làm hoàn toàn hoàn hảo.

Kết quả là bạn nên cân nhắc khả năng tiếp cận ngay từ đầu trong _mọi_ dự án web, nhưng hãy nhớ rằng các cơ sở code trừu tượng sử dụng framework có nhiều khả năng bị các vấn đề khả năng tiếp cận nghiêm trọng nếu bạn không.

## Cách chọn framework

Mỗi framework được thảo luận trong module này có cách tiếp cận khác nhau về phát triển ứng dụng web. Mỗi framework đang thường xuyên được cải thiện hoặc thay đổi, và mỗi framework có ưu và nhược điểm riêng. Chọn framework phù hợp là quá trình phụ thuộc vào nhóm và dự án, và bạn nên tự nghiên cứu để tìm ra cái phù hợp với nhu cầu của bạn. Điều đó nói, chúng tôi đã xác định một số câu hỏi bạn có thể đặt ra để nghiên cứu các lựa chọn của mình hiệu quả hơn:

1. Những trình duyệt nào mà framework hỗ trợ?
2. Những ngôn ngữ đặc thù miền nào mà framework sử dụng?
3. Framework có cộng đồng mạnh và tài liệu tốt (và hỗ trợ khác) không?

Bảng trong phần này cung cấp tóm tắt nhanh về _hỗ trợ trình duyệt_ hiện tại được cung cấp bởi mỗi framework, cũng như **ngôn ngữ đặc thù miền** mà nó có thể được sử dụng.

Nói chung, {{Glossary("DSL/Domain_specific_language", "ngôn ngữ đặc thù miền (DSL)")}} là các ngôn ngữ lập trình liên quan đến các lĩnh vực cụ thể của phát triển phần mềm. Trong bối cảnh framework, DSL là các biến thể của JavaScript hoặc HTML giúp phát triển dễ dàng hơn với framework đó. Quan trọng là, không có framework nào _yêu cầu_ nhà phát triển sử dụng một DSL cụ thể, nhưng chúng hầu hết đã được thiết kế với một DSL cụ thể trong tâm trí. Chọn không sử dụng DSL ưa thích của framework sẽ có nghĩa là bạn bỏ lỡ các tính năng mà nếu không sẽ cải thiện trải nghiệm nhà phát triển của bạn.

Bạn nên cân nhắc nghiêm túc ma trận hỗ trợ và DSL của framework khi đưa ra lựa chọn cho bất kỳ dự án mới nào. Hỗ trợ trình duyệt không khớp có thể là rào cản cho người dùng; hỗ trợ DSL không khớp có thể là rào cản cho bạn và đồng nghiệp của bạn.

| Framework | Hỗ trợ trình duyệt               | DSL ưa thích | Các DSL được hỗ trợ    | Trích dẫn                                                                             |
| --------- | -------------------------------- | ------------ | ---------------------- | ------------------------------------------------------------------------------------- |
| Angular   | Hiện đại                         | TypeScript   | HTML-based; TypeScript | [tài liệu chính thức](https://angular.dev/guide/browser-support)                      |
| React     | Hiện đại                         | JSX          | JSX; TypeScript        | [tài liệu chính thức](https://react.dev/reference/react-dom/client#browser-support)   |
| Vue       | Hiện đại (IE9+ trong Vue 2)      | HTML-based   | HTML-based, JSX, Pug   | [tài liệu chính thức](https://cli.vuejs.org/guide/browser-compatibility.html)         |
| Ember     | Hiện đại (IE9+ trong Ember 2.18) | Handlebars   | Handlebars, TypeScript | [tài liệu chính thức](https://guides.emberjs.com/v3.3.0/templates/handlebars-basics/) |

> [!NOTE]
> Các DSL chúng tôi mô tả là "dựa trên HTML" không có tên chính thức. Chúng không thực sự là DSL thực sự, nhưng chúng là HTML không tiêu chuẩn, vì vậy chúng tôi tin rằng chúng đáng được nhấn mạnh.

### Framework có cộng đồng mạnh không?

Đây có lẽ là số liệu khó đo nhất vì kích thước cộng đồng không tương quan trực tiếp với các con số dễ truy cập. Bạn có thể kiểm tra số lượng sao GitHub hoặc số lượt tải xuống npm hàng tuần của dự án để hiểu về mức độ phổ biến của nó, nhưng đôi khi điều tốt nhất cần làm là tìm kiếm một số diễn đàn hoặc nói chuyện với các nhà phát triển khác. Đó không chỉ là về kích thước cộng đồng, mà còn là về mức độ chào đón và hòa nhập của nó, và mức độ tốt của tài liệu có sẵn.

### Ý kiến trên web

Đừng chỉ tin vào lời của chúng tôi về vấn đề này — có các cuộc thảo luận khắp web. Wikimedia Foundation gần đây đã chọn sử dụng Vue cho giao diện front-end của mình, và đã đăng một [yêu cầu nhận xét (RFC) về việc áp dụng framework](https://phabricator.wikimedia.org/T241180). Eric Gardner, tác giả của RFC, đã dành thời gian để phác thảo nhu cầu của dự án Wikimedia và tại sao một số framework là lựa chọn tốt cho nhóm. RFC này phục vụ như một ví dụ tuyệt vời về loại nghiên cứu bạn nên tự thực hiện khi lên kế hoạch sử dụng framework front-end.

[Khảo sát Trạng thái của JavaScript](https://stateofjs.com/) là một bộ sưu tập phản hồi hữu ích từ các nhà phát triển JavaScript. Nó bao gồm nhiều chủ đề liên quan đến JavaScript, bao gồm dữ liệu về cả việc sử dụng framework và tình cảm nhà phát triển đối với chúng. Hiện tại, có vài năm dữ liệu có sẵn, cho phép bạn cảm nhận về mức độ phổ biến của framework.

Nhóm Vue đã [so sánh Vue một cách kỹ lưỡng với các framework phổ biến khác](https://v2.vuejs.org/v2/guide/comparison.html). Có thể có một số thiên vị trong so sánh này (mà họ lưu ý), nhưng dù sao đó là một tài nguyên có giá trị.

## Các giải pháp thay thế cho framework phía client

Nếu bạn đang tìm kiếm các công cụ để đẩy nhanh quá trình phát triển web, và bạn biết dự án của mình sẽ không yêu cầu JavaScript phía client mạnh mẽ, bạn có thể chọn một trong số ít các giải pháp khác để xây dựng web:

- Hệ thống quản lý nội dung
- Kết xuất phía máy chủ
- Trình tạo trang tĩnh

### Hệ thống quản lý nội dung

**Hệ thống quản lý nội dung** (**CMS**) là bất kỳ công cụ nào cho phép người dùng tạo nội dung cho web mà không cần trực tiếp tự viết code. Chúng là giải pháp tốt cho các dự án lớn, đặc biệt là các dự án yêu cầu đầu vào từ những người viết nội dung có khả năng lập trình hạn chế, hoặc cho các lập trình viên muốn tiết kiệm thời gian. Tuy nhiên, chúng đòi hỏi một lượng thời gian đáng kể để thiết lập, và sử dụng CMS có nghĩa là bạn từ bỏ ít nhất một số quyền kiểm soát đối với đầu ra cuối cùng của trang web của bạn. Ví dụ: nếu CMS bạn chọn không tạo nội dung có thể tiếp cận theo mặc định, thì thường khó cải thiện điều này.

Một số hệ thống CMS phổ biến bao gồm [WordPress](https://wordpress.com/), [Joomla](https://www.joomla.org/) và [Drupal](https://new.drupal.org/).

### Kết xuất phía máy chủ

**Kết xuất phía máy chủ** (**SSR**) là kiến trúc ứng dụng trong đó công việc của _máy chủ_ là kết xuất một ứng dụng trang đơn. Đây là ngược lại với _kết xuất phía client_, là cách phổ biến và đơn giản nhất để xây dựng ứng dụng JavaScript. Kết xuất phía máy chủ dễ dàng hơn cho thiết bị của client vì bạn chỉ gửi cho họ một tệp HTML đã kết xuất, nhưng nó có thể khó thiết lập so với ứng dụng kết xuất phía client.

Tất cả các framework được đề cập trong module này hỗ trợ kết xuất phía máy chủ cũng như kết xuất phía client. Xem [Next.js](https://nextjs.org/) cho React, [Nuxt](https://nuxt.com/) cho Vue (đúng vậy, đó là tên gây nhầm lẫn, và không, các dự án này không liên quan!), [FastBoot](https://github.com/ember-fastboot/ember-cli-fastboot) cho Ember, và [Angular Universal](https://angular.dev/guide/universal) cho Angular.

> [!NOTE]
> Một số giải pháp SSR được viết và duy trì bởi cộng đồng, trong khi một số là các giải pháp "chính thức" được cung cấp bởi người duy trì framework.

### Trình tạo trang tĩnh

[Trình tạo trang tĩnh](/en-US/docs/Glossary/SSG) là các chương trình tạo động tất cả các trang web của một trang web nhiều trang — bao gồm bất kỳ CSS hoặc JavaScript liên quan — để chúng có thể được xuất bản ở bất kỳ nơi nào. Máy chủ xuất bản có thể là một nhánh GitHub pages, một phiên bản Netlify, hoặc bất kỳ máy chủ riêng tư nào bạn chọn. Có một số ưu điểm của cách tiếp cận này, chủ yếu xoay quanh hiệu suất (thiết bị của người dùng không xây dựng trang bằng JavaScript; nó đã hoàn chỉnh rồi) và bảo mật (các trang tĩnh có ít vectơ tấn công hơn). Các trang này vẫn có thể sử dụng JavaScript khi cần, nhưng chúng không _phụ thuộc_ vào nó. Trình tạo trang tĩnh mất thời gian để học, giống như bất kỳ công cụ nào khác, điều này có thể là rào cản cho quá trình phát triển của bạn.

Các trang tĩnh có thể có ít hoặc nhiều trang duy nhất tùy ý. Giống như framework cho phép bạn nhanh chóng viết các ứng dụng JavaScript phía client, trình tạo trang tĩnh cho phép bạn một cách để nhanh chóng tạo các tệp HTML mà bạn nếu không sẽ phải viết riêng lẻ. Giống như framework, trình tạo trang tĩnh cho phép các nhà phát triển viết các thành phần định nghĩa các phần chung của trang web của bạn, và kết hợp các thành phần đó để tạo trang cuối cùng. Trong bối cảnh trình tạo trang tĩnh, các thành phần này được gọi là **mẫu**. Các trang web được xây dựng bởi trình tạo trang tĩnh thậm chí có thể là nơi chứa các ứng dụng framework: nếu bạn muốn một trang cụ thể của trang web được tạo tĩnh để khởi động ứng dụng React khi người dùng truy cập nó, bạn có thể làm điều đó.

Trình tạo trang tĩnh đã tồn tại khá lâu, và chúng đang được tối ưu hóa và đổi mới liên tục. Một loạt các lựa chọn tồn tại, bao gồm [Astro](https://astro.build/), [Eleventy](https://www.11ty.dev/), [Hugo](https://gohugo.io/), [Jekyll](https://jekyllrb.com/), và [Gatsby](https://www.gatsbyjs.com/), xây dựng trên nhiều stack công nghệ khác nhau và cung cấp các tính năng đặc biệt. Các lựa chọn khác, chẳng hạn như [Docusaurus](https://docusaurus.io/) và [VitePress](https://vitepress.dev/), sử dụng framework phía client thay vì các mẫu, nhưng tạo ra các tệp tĩnh được tối ưu hóa tương tự.

Nếu bạn muốn tìm hiểu thêm về trình tạo trang tĩnh nói chung, hãy xem [Hướng dẫn người mới bắt đầu cho Eleventy](https://www.tatianamac.com/posts/beginner-eleventy-tutorial-parti/) của Tatiana Mac. Trong bài viết đầu tiên của series, họ giải thích trình tạo trang tĩnh là gì và cách nó liên quan đến các phương tiện xuất bản nội dung web khác.

## Tóm tắt

Và điều đó đưa chúng ta đến cuối giới thiệu về framework — chúng tôi chưa dạy bạn bất kỳ code nào, nhưng hy vọng chúng tôi đã cung cấp cho bạn nền tảng hữu ích về lý do tại sao bạn sẽ sử dụng framework ngay từ đầu và cách chọn một framework, đồng thời khiến bạn phấn khích để học thêm và bắt tay vào!

Bài viết tiếp theo của chúng ta đi sâu hơn, xem xét các loại tính năng cụ thể mà framework thường cung cấp, và tại sao chúng hoạt động như vậy.

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Main_features", "Learn_web_development/Core/Frameworks_libraries")}}
