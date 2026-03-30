---
title: Làm việc với Svelte stores
slug: Learn_web_development/Core/Frameworks_libraries/Svelte_stores
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_reactivity_lifecycle_accessibility","Learn_web_development/Core/Frameworks_libraries/Svelte_TypeScript", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài viết trước, chúng ta đã hoàn thành việc phát triển ứng dụng, hoàn thiện việc tổ chức nó thành các thành phần, và thảo luận về một số kỹ thuật nâng cao để xử lý khả năng phản ứng, làm việc với các nút DOM, và hiển thị chức năng của thành phần. Trong bài viết này chúng ta sẽ tìm hiểu một cách khác để xử lý quản lý trạng thái trong Svelte: [Stores](https://learn.svelte.dev/tutorial/writable-stores). Stores là các kho lưu trữ dữ liệu toàn cục chứa các giá trị. Các thành phần có thể đăng ký theo dõi stores và nhận thông báo khi giá trị của chúng thay đổi.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Tối thiểu, bạn nên quen thuộc với các ngôn ngữ
          <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
          <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
          và có kiến thức về
          <a
            href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/dòng lệnh</a
          >.
        </p>
        <p>
          Bạn sẽ cần một terminal với node và npm đã cài đặt để biên dịch và xây dựng ứng dụng của mình.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Học cách sử dụng Svelte stores</td>
    </tr>
  </tbody>
</table>

Sử dụng stores, chúng ta sẽ tạo một thành phần `Alert` hiển thị thông báo trên màn hình, có thể nhận tin nhắn từ bất kỳ thành phần nào. Trong trường hợp này, thành phần `Alert` độc lập với phần còn lại — nó không phải là cha hay con của bất kỳ thành phần nào khác — vì vậy các tin nhắn không phù hợp với hệ thống phân cấp thành phần.

Chúng ta cũng sẽ xem cách phát triển store tùy chỉnh của riêng mình để lưu trữ thông tin todo vào [web storage](/en-US/docs/Web/API/Web_Storage_API), cho phép các việc cần làm của chúng ta tồn tại khi tải lại trang.

## Lập trình cùng chúng tôi

### Git

Clone repo GitHub (nếu bạn chưa làm) với:

```bash
git clone https://github.com/opensas/mdn-svelte-tutorial.git
```

Sau đó để đến trạng thái ứng dụng hiện tại, chạy

```bash
cd mdn-svelte-tutorial/06-stores
```

Hoặc tải trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/06-stores
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Để lập trình cùng chúng tôi bằng REPL, bắt đầu tại

<https://svelte.dev/repl/d1fa84a5a4494366b179c87395940039?version=3.23.2>

## Xử lý trạng thái ứng dụng

Chúng ta đã thấy cách các thành phần có thể giao tiếp với nhau bằng cách sử dụng props, ràng buộc dữ liệu hai chiều và sự kiện. Trong tất cả các trường hợp này, chúng ta đang xử lý giao tiếp giữa các thành phần cha và con.

Nhưng không phải tất cả trạng thái ứng dụng đều thuộc bên trong hệ thống phân cấp thành phần của ứng dụng bạn. Ví dụ, thông tin về người dùng đã đăng nhập, hoặc liệu chủ đề tối có được chọn hay không.

Đôi khi, trạng thái ứng dụng của bạn sẽ cần được truy cập bởi nhiều thành phần không có quan hệ phân cấp với nhau, hoặc bởi một module JavaScript thông thường.

Hơn nữa, khi ứng dụng của bạn trở nên phức tạp và hệ thống phân cấp thành phần trở nên phức tạp, việc các thành phần truyền dữ liệu qua lại với nhau có thể trở nên quá khó khăn. Trong trường hợp đó, chuyển sang một kho lưu trữ dữ liệu toàn cục có thể là lựa chọn tốt. Nếu bạn đã từng làm việc với [Redux](https://redux.js.org/) hoặc [Vuex](https://vuex.vuejs.org/), thì bạn sẽ quen thuộc với cách hoạt động của loại store này. Svelte stores cung cấp các tính năng tương tự để quản lý trạng thái.

Một store là một đối tượng có phương thức `subscribe()` cho phép các bên quan tâm được thông báo bất cứ khi nào giá trị store thay đổi và một phương thức `set()` tùy chọn cho phép bạn đặt các giá trị mới cho store. API tối giản này được gọi là [store contract](https://svelte.dev/docs/svelte-components#script-4-prefix-stores-with-$-to-access-their-values-store-contract).

Svelte cung cấp các hàm để tạo store [readable](https://svelte.dev/docs/svelte-store#readable), [writable](https://svelte.dev/docs/svelte-store#writable), và [derived](https://svelte.dev/docs/svelte-store#derived) trong module `svelte/store`.

Svelte cũng cung cấp một cách rất trực quan để tích hợp stores vào hệ thống khả năng phản ứng của nó bằng cách sử dụng [cú pháp reactive `$store`](https://svelte.dev/docs/svelte-components#script-4-prefix-stores-with-$-to-access-their-values). Nếu bạn tạo stores của riêng mình theo đúng store contract, bạn sẽ được nhận cú pháp tiện lợi này miễn phí.

## Tạo thành phần Alert

Để minh họa cách làm việc với stores, chúng ta sẽ tạo một thành phần `Alert`. Những widget này cũng có thể được gọi là thông báo popup, toast, hoặc bong bóng thông báo.

Thành phần `Alert` của chúng ta sẽ được hiển thị bởi thành phần `App`, nhưng bất kỳ thành phần nào cũng có thể gửi thông báo đến nó. Bất cứ khi nào một thông báo đến, thành phần `Alert` sẽ chịu trách nhiệm hiển thị nó trên màn hình.

### Tạo một store

Hãy bắt đầu bằng cách tạo một writable store. Bất kỳ thành phần nào cũng có thể ghi vào store này, và thành phần `Alert` sẽ đăng ký theo dõi nó và hiển thị một tin nhắn bất cứ khi nào store được sửa đổi.

1. Tạo một tệp mới, `stores.js`, bên trong thư mục `src` của bạn.
2. Cung cấp cho nó nội dung sau:

   ```js
   import { writable } from "svelte/store";

   export const alert = writable("Welcome to the to-do list app!");
   ```

> [!NOTE]
> Stores có thể được định nghĩa và sử dụng bên ngoài các thành phần Svelte, vì vậy bạn có thể tổ chức chúng theo bất kỳ cách nào bạn muốn.

Trong đoạn code trên, chúng ta import hàm `writable()` từ `svelte/store` và sử dụng nó để tạo một store mới có tên `alert` với giá trị ban đầu là "Welcome to the to-do list app!". Sau đó chúng ta `export` store.

### Tạo thành phần thực tế

Bây giờ hãy tạo thành phần `Alert` của chúng ta và xem cách chúng ta có thể đọc các giá trị từ store.

1. Tạo một tệp mới khác có tên `src/components/Alert.svelte`.
2. Cung cấp cho nó nội dung sau:

   ```svelte
   <script>
     import { alert } from "../stores.js";
     import { onDestroy } from "svelte";

     let alertContent = "";

     const unsubscribe = alert.subscribe((value) => (alertContent = value));

     onDestroy(unsubscribe);
   </script>

   {#if alertContent}
   <div on:click={() => (alertContent = "")}>
     <p>{ alertContent }</p>
   </div>
   {/if}

   <style>
   div {
     position: fixed;
     cursor: pointer;
     margin-right: 1.5rem;
     margin-left: 1.5rem;
     margin-top: 1rem;
     right: 0;
     display: flex;
     align-items: center;
     border-radius: 0.2rem;
     background-color: #565656;
     color: white;
     font-weight: bold;
     padding: 0.5rem 1.4rem;
     font-size: 1.5rem;
     z-index: 100;
     opacity: 95%;
   }
   div p {
     color: white;
   }
   div svg {
     height: 1.6rem;
     fill: currentColor;
     width: 1.4rem;
     margin-right: 0.5rem;
   }
   </style>
   ```

Hãy cùng xem qua đoạn code này một cách chi tiết.

- Đầu tiên chúng ta import store `alert`.
- Tiếp theo chúng ta import hàm vòng đời `onDestroy()`, cho phép chúng ta thực thi một callback sau khi thành phần đã bị unmount.
- Sau đó chúng ta tạo một biến cục bộ có tên `alertContent`. Nhớ rằng chúng ta có thể truy cập các biến cấp độ cao nhất từ markup, và bất cứ khi nào chúng được sửa đổi, DOM sẽ cập nhật tương ứng.
- Sau đó chúng ta gọi phương thức `alert.subscribe()`, truyền cho nó một hàm callback làm tham số. Bất cứ khi nào giá trị của store thay đổi, hàm callback sẽ được gọi với giá trị mới làm tham số của nó. Trong hàm callback, chúng ta chỉ gán giá trị nhận được cho biến cục bộ, điều này sẽ kích hoạt cập nhật DOM của thành phần.
- Phương thức `subscribe()` cũng trả về một hàm cleanup, chịu trách nhiệm giải phóng subscription. Vì vậy chúng ta đăng ký khi thành phần đang được khởi tạo, và sử dụng `onDestroy` để hủy đăng ký khi thành phần bị unmount.
- Cuối cùng chúng ta sử dụng biến `alertContent` trong markup, và nếu người dùng nhấp vào alert chúng ta xóa nó.
- Ở cuối chúng ta bao gồm một vài dòng CSS để tạo kiểu cho thành phần `Alert`.

Thiết lập này cho phép chúng ta làm việc với stores theo cách phản ứng. Khi giá trị của store thay đổi, callback được thực thi. Ở đó chúng ta gán một giá trị mới cho biến cục bộ, và nhờ khả năng phản ứng của Svelte tất cả markup và các phụ thuộc phản ứng của chúng ta được cập nhật tương ứng.

### Sử dụng thành phần

Bây giờ hãy sử dụng thành phần của chúng ta.

1. Trong `App.svelte` chúng ta sẽ import thành phần. Thêm câu lệnh import sau bên dưới câu lệnh hiện có:

   ```js
   import Alert from "./components/Alert.svelte";
   ```

2. Sau đó gọi thành phần `Alert` ngay phía trên lời gọi `Todos`, như thế này:

   ```svelte
   <Alert />
   <Todos {todos} />
   ```

3. Tải ứng dụng thử nghiệm của bạn bây giờ, và bạn sẽ thấy thông báo `Alert` trên màn hình. Bạn có thể nhấp vào nó để đóng lại.

   ![A simple notification in the top right-hand corner of an app saying welcome to the to-do list app](01-alert-message.png)

## Làm cho stores phản ứng với cú pháp reactive `$store`

Điều này hoạt động, nhưng bạn sẽ phải sao chép và dán tất cả code này mỗi lần bạn muốn đăng ký theo dõi một store:

```svelte
<script>
  import myStore from "./stores.js";
  import { onDestroy } from "svelte";

  let myStoreContent = "";

  const unsubscribe = myStore.subscribe((value) => (myStoreContent = value));

  onDestroy(unsubscribe);
</script>

{myStoreContent}
```

Đó là quá nhiều boilerplate cho Svelte! Là một trình biên dịch, Svelte có nhiều tài nguyên hơn để làm cho cuộc sống của chúng ta dễ dàng hơn. Trong trường hợp này Svelte cung cấp cú pháp reactive `$store`, còn được gọi là auto-subscription. Nói đơn giản, bạn chỉ cần thêm tiền tố `$` vào trước store và Svelte sẽ tự động tạo code để làm cho nó phản ứng. Vì vậy, khối code trước của chúng ta có thể được thay thế bằng cái này:

```svelte
<script>
  import myStore from "./stores.js";
</script>

{$myStore}
```

Và `$myStore` sẽ hoàn toàn phản ứng. Điều này cũng áp dụng cho các store tùy chỉnh của riêng bạn. Nếu bạn triển khai các phương thức `subscribe()` và `set()`, như chúng ta sẽ làm sau, cú pháp reactive `$store` cũng sẽ áp dụng cho các store của bạn.

1. Hãy áp dụng điều này cho thành phần `Alert`. Cập nhật các phần `<script>` và markup của `Alert.svelte` như sau:

   ```svelte
   <script>
     import { alert } from "../stores.js";
   </script>

   {#if $alert}
   <div on:click={() => $alert = ""}>
     <p>{ $alert }</p>
   </div>
   {/if}
   ```

2. Kiểm tra ứng dụng của bạn một lần nữa và bạn sẽ thấy rằng nó hoạt động như trước. Tốt hơn nhiều!

Phía sau, Svelte đã tạo code để khai báo biến cục bộ `$alert`, đăng ký theo dõi store `alert`, cập nhật `$alert` bất cứ khi nào nội dung của store được sửa đổi, và hủy đăng ký khi thành phần bị unmount. Nó cũng sẽ tạo các câu lệnh `alert.set()` bất cứ khi nào chúng ta gán giá trị cho `$alert`.

Kết quả cuối cùng của thủ thuật khéo léo này là bạn có thể truy cập các stores toàn cục dễ dàng như sử dụng các biến cục bộ phản ứng.

Đây là một ví dụ hoàn hảo về cách Svelte đặt trình biên dịch chịu trách nhiệm về ergonomics tốt hơn cho lập trình viên, không chỉ giúp chúng ta không phải gõ boilerplate, mà còn tạo ra code ít lỗi hơn.

## Ghi vào store

Ghi vào store chỉ là vấn đề import nó và thực thi `$store = 'new value'`. Hãy sử dụng nó trong thành phần `Todos`.

1. Thêm câu lệnh `import` sau bên dưới các câu lệnh hiện có:

   ```js
   import { alert } from "../stores.js";
   ```

2. Cập nhật hàm `addTodo()` như sau:

   ```js
   function addTodo(name) {
     todos = [...todos, { id: newTodoId, name, completed: false }];
     $alert = `Todo '${name}' has been added`;
   }
   ```

3. Cập nhật `removeTodo()` như sau:

   ```js
   function removeTodo(todo) {
     todos = todos.filter((t) => t.id !== todo.id);
     todosStatus.focus(); // give focus to status heading
     $alert = `Todo '${todo.name}' has been deleted`;
   }
   ```

4. Cập nhật hàm `updateTodo()` thành:

   ```js
   function updateTodo(todo) {
     const i = todos.findIndex((t) => t.id === todo.id);
     if (todos[i].name !== todo.name)
       $alert = `todo '${todos[i].name}' has been renamed to '${todo.name}'`;
     if (todos[i].completed !== todo.completed)
       $alert = `todo '${todos[i].name}' marked as ${
         todo.completed ? "completed" : "active"
       }`;
     todos[i] = { ...todos[i], ...todo };
   }
   ```

5. Thêm khối phản ứng sau bên dưới khối bắt đầu bằng `let filter = 'all'`:

   ```js
   $: {
     if (filter === "all") {
       $alert = "Browsing all to-dos";
     } else if (filter === "active") {
       $alert = "Browsing active to-dos";
     } else if (filter === "completed") {
       $alert = "Browsing completed to-dos";
     }
   }
   ```

6. Và cuối cùng, cập nhật các khối `const checkAllTodos` và `const removeCompletedTodos` như sau:

   ```js
   const checkAllTodos = (completed) => {
     todos = todos.map((t) => ({ ...t, completed }));
     $alert = `${completed ? "Checked" : "Unchecked"} ${todos.length} to-dos`;
   };
   const removeCompletedTodos = () => {
     $alert = `Removed ${todos.filter((t) => t.completed).length} to-dos`;
     todos = todos.filter((t) => !t.completed);
   };
   ```

7. Vì vậy về cơ bản, chúng ta đã import store và cập nhật nó trên mọi sự kiện, điều này khiến một alert mới hiển thị mỗi lần. Hãy xem lại ứng dụng của bạn và thử thêm/xóa/cập nhật một vài việc cần làm!

Ngay khi chúng ta thực thi `$alert = …`, Svelte sẽ chạy `alert.set()`. Thành phần `Alert` của chúng ta — như mọi subscriber của alert store — sẽ được thông báo khi nhận được giá trị mới, và nhờ khả năng phản ứng của Svelte, markup của nó sẽ được cập nhật.

Chúng ta có thể làm điều tương tự trong bất kỳ thành phần hoặc tệp `.js` nào.

> [!NOTE]
> Bên ngoài các thành phần Svelte, bạn không thể sử dụng cú pháp `$store`. Đó là vì trình biên dịch Svelte sẽ không xử lý bất cứ thứ gì bên ngoài các thành phần Svelte. Trong trường hợp đó, bạn sẽ phải dựa vào các phương thức `store.subscribe()` và `store.set()`.

## Cải thiện thành phần Alert

Hơi bất tiện khi phải nhấp vào alert để loại bỏ nó. Sẽ tốt hơn nếu thông báo tự biến mất sau vài giây.

Hãy xem cách làm điều đó. Chúng ta sẽ chỉ định một prop với số millisecond để chờ trước khi xóa thông báo, và chúng ta sẽ định nghĩa một timeout để xóa alert. Chúng ta cũng sẽ xử lý việc xóa timeout khi thành phần `Alert` bị unmount để tránh rò rỉ bộ nhớ.

1. Cập nhật phần `<script>` của thành phần `Alert.svelte` như sau:

   ```js
   import { onDestroy } from "svelte";
   import { alert } from "../stores.js";

   export let ms = 3000;
   let visible;
   let timeout;

   const onMessageChange = (message, ms) => {
     clearTimeout(timeout);
     if (!message) {
       // hide Alert if message is empty
       visible = false;
     } else {
       visible = true; // show alert
       if (ms > 0) timeout = setTimeout(() => (visible = false), ms); // and hide it after ms milliseconds
     }
   };
   $: onMessageChange($alert, ms); // whenever the alert store or the ms props changes run onMessageChange

   onDestroy(() => clearTimeout(timeout)); // make sure we clean-up the timeout
   ```

2. Và cập nhật phần markup `Alert.svelte` như sau:

   ```svelte
   {#if visible}
   <div on:click={() => visible = false}>
     <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M12.432 0c1.34 0 2.01.912 2.01 1.957 0 1.305-1.164 2.512-2.679 2.512-1.269 0-2.009-.75-1.974-1.99C9.789 1.436 10.67 0 12.432 0zM8.309 20c-1.058 0-1.833-.652-1.093-3.524l1.214-5.092c.211-.814.246-1.141 0-1.141-.317 0-1.689.562-2.502 1.117l-.528-.88c2.572-2.186 5.531-3.467 6.801-3.467 1.057 0 1.233 1.273.705 3.23l-1.391 5.352c-.246.945-.141 1.271.106 1.271.317 0 1.357-.392 2.379-1.207l.6.814C12.098 19.02 9.365 20 8.309 20z"/></svg>
     <p>{ $alert }</p>
   </div>
   {/if}
   ```

Ở đây, đầu tiên chúng ta tạo prop `ms` với giá trị mặc định là 3000 (milliseconds). Sau đó chúng ta tạo một hàm `onMessageChange()` sẽ kiểm soát việc Alert có hiển thị hay không. Với `$: onMessageChange($alert, ms)`, chúng ta cho Svelte biết để chạy hàm này bất cứ khi nào store `$alert` hoặc prop `ms` thay đổi.

Bất cứ khi nào store `$alert` thay đổi, chúng ta sẽ xóa bất kỳ timeout đang chờ xử lý nào. Nếu `$alert` rỗng, chúng ta đặt `visible` thành `false` và `Alert` sẽ bị xóa khỏi DOM. Nếu không rỗng, chúng ta đặt `visible` thành `true` và sử dụng hàm `setTimeout()` để xóa alert sau `ms` milliseconds.

Cuối cùng, với hàm vòng đời `onDestroy()`, chúng ta đảm bảo gọi hàm `clearTimeout()`.

Chúng ta cũng thêm một biểu tượng SVG phía trên đoạn văn bản alert, để làm cho nó trông đẹp hơn một chút. Hãy thử lại, và bạn sẽ thấy các thay đổi.

## Làm cho thành phần Alert có thể tiếp cận

Thành phần `Alert` của chúng ta đang hoạt động tốt, nhưng nó không thân thiện với các công nghệ hỗ trợ. Vấn đề là các phần tử được thêm và xóa động khỏi trang. Mặc dù rõ ràng về mặt thị giác đối với người dùng có thể nhìn thấy trang, nhưng chúng có thể không rõ ràng với người dùng các công nghệ hỗ trợ, như screen reader. Để xử lý những tình huống này, chúng ta có thể tận dụng [ARIA live regions](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions), cung cấp cách lập trình để hiển thị các thay đổi nội dung động để chúng có thể được phát hiện và thông báo bởi các công nghệ hỗ trợ.

Chúng ta có thể khai báo một vùng chứa nội dung động cần được thông báo bởi các công nghệ hỗ trợ với thuộc tính `aria-live` theo sau là cài đặt politeness, được sử dụng để đặt mức độ ưu tiên mà screen reader nên xử lý các cập nhật cho các vùng đó. Các cài đặt có thể là `off`, `polite`, hoặc `assertive`.

Đối với các tình huống phổ biến, bạn cũng có nhiều giá trị `role` chuyên biệt được xác định trước có thể được sử dụng, như `log`, `status` và `alert`.

Trong trường hợp của chúng ta, chỉ cần thêm `role="alert"` vào container `<div>` sẽ làm được điều đó, như sau:

```svelte
<div role="alert" on:click={() => visible = false}>
```

Nói chung, việc kiểm tra ứng dụng của bạn bằng screen reader là ý tưởng hay, không chỉ để phát hiện các vấn đề khả năng tiếp cận mà còn để quen với cách người khiếm thị sử dụng Web. Bạn có nhiều lựa chọn, như [NVDA](https://www.nvaccess.org/) cho Windows, [ChromeVox](https://support.google.com/chromebook/answer/7031755) cho Chrome, [Orca](https://wiki.gnome.org/Projects/Orca) trên Linux, và [VoiceOver](https://www.apple.com/accessibility/features/?vision) cho macOS và iOS, trong số các lựa chọn khác.

Để tìm hiểu thêm về việc phát hiện và khắc phục các vấn đề khả năng tiếp cận, hãy xem module [Accessibility](/en-US/docs/Learn_web_development/Core/Accessibility) của chúng tôi.

## Sử dụng store contract để lưu trữ việc cần làm

Ứng dụng nhỏ của chúng ta cho phép quản lý việc cần làm khá dễ dàng, nhưng khá vô dụng nếu chúng ta luôn nhận được cùng danh sách việc cần làm được mã hóa cứng khi tải lại. Để làm cho nó thực sự hữu ích, chúng ta phải tìm cách lưu trữ việc cần làm.

Đầu tiên chúng ta cần một cách nào đó để thành phần `Todos` trả lại các việc cần làm đã cập nhật cho cha của nó. Chúng ta có thể phát ra một sự kiện cập nhật với danh sách việc cần làm, nhưng sẽ dễ hơn nếu chỉ ràng buộc biến `todos`. Hãy mở `App.svelte` và thử.

1. Đầu tiên, thêm dòng sau bên dưới mảng `todos`:

   ```js
   $: console.log("todos", todos);
   ```

2. Tiếp theo, cập nhật lời gọi thành phần `Todos` như sau:

   ```svelte
   <Todos bind:todos />
   ```

   > [!NOTE]
   > `<Todos bind:todos />` chỉ là cách viết tắt của `<Todos bind:todos={todos} />`.

3. Quay lại ứng dụng của bạn, thử thêm một vài việc cần làm, sau đó vào console công cụ dành cho nhà phát triển web. Bạn sẽ thấy rằng mọi sửa đổi chúng ta thực hiện đối với việc cần làm đều được phản ánh trong mảng `todos` được định nghĩa trong `App.svelte` nhờ chỉ thị `bind`.

Bây giờ chúng ta phải tìm cách lưu trữ các việc cần làm này. Chúng ta có thể triển khai một số code trong thành phần `App.svelte` để đọc và lưu việc cần làm vào [web storage](/en-US/docs/Web/API/Web_Storage_API) hoặc một web service.
Nhưng sẽ không tốt hơn sao nếu chúng ta có thể phát triển một store chung chung cho phép chúng ta lưu trữ nội dung của nó? Điều này sẽ cho phép chúng ta sử dụng nó giống như bất kỳ store nào khác, và trừu tượng hóa cơ chế lưu trữ. Chúng ta có thể tạo một store đồng bộ nội dung của nó với web storage, và sau đó phát triển một store khác đồng bộ với một web service. Việc chuyển đổi giữa chúng sẽ rất đơn giản và chúng ta sẽ không cần phải chạm vào `App.svelte` chút nào.

### Lưu việc cần làm

Vậy hãy bắt đầu bằng cách sử dụng một writable store thông thường để lưu việc cần làm.

1. Mở tệp `stores.js` và thêm store sau bên dưới store hiện có:

   ```js
   export const todos = writable([]);
   ```

2. Dễ lắm. Bây giờ chúng ta cần import store và sử dụng nó trong `App.svelte`. Chỉ cần nhớ rằng để truy cập các việc cần làm bây giờ, chúng ta phải sử dụng cú pháp reactive `$store` là `$todos`.

   Cập nhật tệp `App.svelte` như sau:

   ```svelte
   <script>
     import Todos from "./components/Todos.svelte";
     import Alert from "./components/Alert.svelte";

     import { todos } from "./stores.js";

     $todos = [
       { id: 1, name: "Create a Svelte starter app", completed: true },
       { id: 2, name: "Create your first component", completed: true },
       { id: 3, name: "Complete the rest of the tutorial", completed: false },
     ];
   </script>

   <Alert />
   <Todos bind:todos={$todos} />
   ```

3. Thử dùng; mọi thứ sẽ hoạt động. Tiếp theo chúng ta sẽ xem cách định nghĩa stores tùy chỉnh của riêng mình.

### Cách triển khai store contract: Lý thuyết

Bạn có thể tạo các store của riêng mình mà không cần dựa vào `svelte/store` bằng cách triển khai store contract. Các tính năng của nó phải hoạt động như sau:

1. Một store phải chứa phương thức `subscribe()`, phải chấp nhận một hàm subscription làm đối số. Tất cả các hàm subscription đang hoạt động của store phải được gọi bất cứ khi nào giá trị của store thay đổi.
2. Phương thức `subscribe()` phải trả về một hàm `unsubscribe()`, khi được gọi phải dừng subscription của nó.
3. Một store có thể tùy chọn chứa phương thức `set()`, phải chấp nhận một giá trị mới cho store làm đối số, và đồng bộ gọi tất cả các hàm subscription đang hoạt động của store. Một store có phương thức `set()` được gọi là writable store.

Đầu tiên, hãy thêm các câu lệnh `console.log()` sau vào thành phần `App.svelte` để xem store `todos` và nội dung của nó trong thực tế. Thêm các dòng này bên dưới mảng `todos`:

```js
console.log("todos store - todos:", todos);
console.log("todos store content - $todos:", $todos);
```

Khi bạn chạy ứng dụng bây giờ, bạn sẽ thấy điều gì đó như thế này trong console web của bạn:

![web console showing the functions and contents of the todos store](02-svelte-store-in-action.png)

Như bạn có thể thấy, store của chúng ta chỉ là một đối tượng chứa các phương thức `subscribe()`, `set()`, và `update()`, và `$todos` là mảng việc cần làm.

Chỉ để tham khảo, đây là một store cơ bản hoạt động được triển khai từ đầu:

```js
export const writable = (initialValue = 0) => {
  let value = initialValue; // content of the store
  let subs = []; // subscriber's handlers

  const subscribe = (handler) => {
    subs = [...subs, handler]; // add handler to the array of subscribers
    handler(value); // call handler with current value
    return () => (subs = subs.filter((sub) => sub !== handler)); // return unsubscribe function
  };

  const set = (newValue) => {
    if (value === newValue) return; // same value, exit
    value = newValue; // update value
    subs.forEach((sub) => sub(value)); // update subscribers
  };

  const update = (updateFn) => set(updateFn(value)); // update function

  return { subscribe, set, update }; // store contract
};
```

Ở đây chúng ta khai báo `subs`, là một mảng các subscriber. Trong phương thức `subscribe()`, chúng ta thêm handler vào mảng `subs` và trả về một hàm, khi được thực thi, sẽ xóa handler khỏi mảng.

Khi chúng ta gọi `set()`, chúng ta cập nhật giá trị của store và gọi mỗi handler, truyền giá trị mới làm tham số.

Thường thì bạn không triển khai stores từ đầu; thay vào đó bạn sẽ sử dụng writable store để tạo [custom stores](https://learn.svelte.dev/tutorial/custom-stores) với logic đặc thù theo miền. Trong ví dụ sau, chúng ta tạo một counter store, chỉ cho phép chúng ta thêm một vào counter hoặc đặt lại giá trị của nó:

```js
import { writable } from "svelte/store";

function myStore() {
  const { subscribe, set, update } = writable(0);

  return {
    subscribe,
    addOne: () => update((n) => n + 1),
    reset: () => set(0),
  };
}
```

Nếu ứng dụng danh sách việc cần làm của chúng ta trở nên quá phức tạp, chúng ta có thể để store việc cần làm xử lý mọi sửa đổi trạng thái. Chúng ta có thể di chuyển tất cả các phương thức sửa đổi mảng `todo` (như `addTodo()`, `removeTodo()`, v.v.) từ thành phần `Todos` sang store. Nếu bạn có một nơi trung tâm nơi tất cả các sửa đổi trạng thái được áp dụng, các thành phần chỉ cần gọi những phương thức đó để sửa đổi trạng thái ứng dụng và hiển thị thông tin phản ứng được hiển thị bởi store. Việc có một nơi duy nhất để xử lý các sửa đổi trạng thái giúp dễ dàng hơn trong việc lý luận về luồng trạng thái và phát hiện vấn đề.

Svelte sẽ không buộc bạn tổ chức quản lý trạng thái theo một cách cụ thể; nó chỉ cung cấp các công cụ để bạn chọn cách xử lý nó.

### Triển khai store việc cần làm tùy chỉnh

Ứng dụng danh sách việc cần làm của chúng ta không đặc biệt phức tạp, vì vậy chúng ta sẽ không di chuyển tất cả các phương thức sửa đổi vào một nơi trung tâm. Chúng ta sẽ chỉ để chúng như hiện tại, và thay vào đó tập trung vào việc lưu trữ việc cần làm.

> [!NOTE]
> Nếu bạn đang theo dõi hướng dẫn này bằng cách làm việc từ Svelte REPL, bạn sẽ không thể hoàn thành bước này. Vì lý do bảo mật, Svelte REPL hoạt động trong môi trường sandbox sẽ không cho phép bạn truy cập web storage, và bạn sẽ nhận được lỗi "The operation is insecure". Để theo dõi phần này, bạn sẽ phải clone repo và vào thư mục `mdn-svelte-tutorial/06-stores`, hoặc bạn có thể tải trực tiếp nội dung thư mục với `npx degit opensas/mdn-svelte-tutorial/06-stores`.

Để triển khai một custom store lưu nội dung của nó vào web storage, chúng ta sẽ cần một writable store thực hiện những điều sau:

- Ban đầu đọc giá trị từ web storage, và nếu không có, khởi tạo nó với giá trị mặc định
- Bất cứ khi nào giá trị được sửa đổi, cập nhật chính store và cả dữ liệu trong local storage

Hơn nữa, vì web storage chỉ hỗ trợ lưu các giá trị chuỗi, chúng ta sẽ phải chuyển đổi từ đối tượng sang chuỗi khi lưu, và ngược lại khi chúng ta đang tải giá trị từ local storage.

1. Tạo một tệp mới có tên `localStore.js`, trong thư mục `src` của bạn.
2. Cung cấp cho nó nội dung sau:

   ```js
   import { writable } from "svelte/store";

   export const localStore = (key, initial) => {
     // receives the key of the local storage and an initial value

     const toString = (value) => JSON.stringify(value, null, 2); // helper function
     const toObj = JSON.parse; // helper function

     if (localStorage.getItem(key) === null) {
       // item not present in local storage
       localStorage.setItem(key, toString(initial)); // initialize local storage with initial value
     }

     const saved = toObj(localStorage.getItem(key)); // convert to object

     const { subscribe, set, update } = writable(saved); // create the underlying writable store

     return {
       subscribe,
       set(value) {
         localStorage.setItem(key, toString(value)); // save also to local storage as a string
         return set(value);
       },
       update,
     };
   };
   ```

   - `localStore` của chúng ta sẽ là một hàm, khi được thực thi, ban đầu đọc nội dung của nó từ web storage, và trả về một đối tượng với ba phương thức: `subscribe()`, `set()`, và `update()`.
   - Khi chúng ta tạo một `localStore` mới, chúng ta sẽ phải chỉ định key của web storage và một giá trị ban đầu. Sau đó chúng ta kiểm tra xem giá trị có tồn tại trong web storage không và, nếu không, chúng ta tạo nó.
   - Chúng ta sử dụng các phương thức [`localStorage.getItem(key)`](/en-US/docs/Web/API/Storage/getItem) và [`localStorage.setItem(key, value)`](/en-US/docs/Web/API/Storage/setItem) để đọc và ghi thông tin vào web storage, và các hàm helper [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString) và `toObj()` (sử dụng [`JSON.parse()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse)) để chuyển đổi các giá trị.
   - Tiếp theo, chúng ta chuyển đổi nội dung chuỗi nhận được từ web storage thành một đối tượng, và lưu đối tượng đó trong store.
   - Cuối cùng, mỗi khi chúng ta cập nhật nội dung của store, chúng ta cũng cập nhật web storage, với giá trị được chuyển đổi thành chuỗi.

   Lưu ý rằng chúng ta chỉ phải định nghĩa lại phương thức `set()`, thêm thao tác lưu giá trị vào web storage. Phần còn lại của code chủ yếu là khởi tạo và chuyển đổi nội dung.

3. Bây giờ chúng ta sẽ sử dụng local store từ `stores.js` để tạo store việc cần làm được lưu trữ cục bộ.

   Cập nhật `stores.js` như sau:

   ```js
   import { writable } from "svelte/store";
   import { localStore } from "./localStore.js";

   export const alert = writable("Welcome to the to-do list app!");

   const initialTodos = [
     { id: 1, name: "Visit MDN web docs", completed: true },
     { id: 2, name: "Complete the Svelte Tutorial", completed: false },
   ];

   export const todos = localStore("mdn-svelte-todo", initialTodos);
   ```

   Sử dụng `localStore('mdn-svelte-todo', initialTodos)`, chúng ta đang cấu hình store để lưu dữ liệu trong web storage dưới key `mdn-svelte-todo`. Chúng ta cũng đặt một vài todos làm giá trị ban đầu.

4. Bây giờ hãy loại bỏ các việc cần làm được mã hóa cứng trong `App.svelte`. Cập nhật nội dung của nó như sau. Chúng ta về cơ bản chỉ xóa mảng `$todos` và các câu lệnh `console.log()`:

   ```svelte
   <script>
     import Todos from "./components/Todos.svelte";
     import Alert from "./components/Alert.svelte";

     import { todos } from "./stores.js";
   </script>

   <Alert />
   <Todos bind:todos={$todos} />
   ```

   > [!NOTE]
   > Đây là thay đổi duy nhất chúng ta phải thực hiện để sử dụng store tùy chỉnh. `App.svelte` hoàn toàn không biết chúng ta đang sử dụng loại store gì.

5. Hãy tiếp tục và thử ứng dụng của bạn một lần nữa. Tạo một vài việc cần làm và sau đó đóng trình duyệt. Bạn thậm chí có thể dừng máy chủ Svelte và khởi động lại. Khi truy cập lại URL, các việc cần làm của bạn vẫn sẽ ở đó.
6. Bạn cũng có thể kiểm tra nó trong console DevTools. Trong console web, nhập lệnh `localStorage.getItem('mdn-svelte-todo')`. Thực hiện một số thay đổi cho ứng dụng, như nhấn nút _Uncheck All_, và kiểm tra nội dung web storage một lần nữa. Bạn sẽ nhận được điều gì đó như thế này:

   ![to-do app with web console view alongside it, showing that when a to-do is changed in the app, the corresponding entry is changed in web storage](03-persisting-todos-to-local-storage.png)

Svelte stores cung cấp một cách rất đơn giản và nhẹ nhàng, nhưng cực kỳ mạnh mẽ, để xử lý trạng thái ứng dụng phức tạp từ một kho lưu trữ dữ liệu toàn cục theo cách phản ứng. Và vì Svelte biên dịch code của chúng ta, nó có thể cung cấp [cú pháp `$store` auto-subscription](https://svelte.dev/docs/svelte-components#script-4-prefix-stores-with-$-to-access-their-values) cho phép chúng ta làm việc với stores theo cách tương tự như biến cục bộ. Vì stores có API tối giản, rất đơn giản để tạo các store tùy chỉnh để trừu tượng hóa các cơ chế bên trong của chính store.

## Bonus track: Transitions (Hiệu ứng chuyển đổi)

Hãy thay đổi chủ đề và làm điều gì đó vui vẻ và khác biệt: thêm hoạt ảnh vào các alert. Svelte cung cấp một module đầy đủ để định nghĩa [transitions](https://learn.svelte.dev/tutorial/transition) và [animations](https://learn.svelte.dev/tutorial/animate) để chúng ta có thể làm cho giao diện người dùng hấp dẫn hơn.

Một transition được áp dụng với chỉ thị [transition:fn](https://svelte.dev/docs/element-directives#transition-fn), và được kích hoạt bởi một phần tử vào hoặc rời khỏi DOM do kết quả của sự thay đổi trạng thái.

Hãy cho thành phần `Alert` của chúng ta một transition `fly`. Chúng ta sẽ mở tệp `Alert.svelte` và import hàm `fly` từ module `svelte/transition`.

1. Đặt câu lệnh `import` sau bên dưới các câu lệnh hiện có:

   ```js
   import { fly } from "svelte/transition";
   ```

2. Để sử dụng nó, cập nhật thẻ mở `<div>` của bạn như sau:

   ```svelte
   <div role="alert" on:click={() => visible = false}
     transition:fly
   >
   ```

   Transitions cũng có thể nhận tham số, như thế này:

   ```svelte
   <div role="alert" on:click={() => visible = false}
     transition:fly="\{{delay: 250, duration: 300, x: 0, y: -100, opacity: 0.5}}"
   >
   ```

   > [!NOTE]
   > Dấu ngoặc nhọn kép không phải là cú pháp Svelte đặc biệt. Đó chỉ là một đối tượng JavaScript nghĩa đen được truyền làm tham số cho transition fly.

3. Thử lại ứng dụng của bạn, và bạn sẽ thấy rằng các thông báo bây giờ trông hấp dẫn hơn một chút.

> [!NOTE]
> Là một trình biên dịch, Svelte có thể tối ưu hóa kích thước bundle của chúng ta bằng cách loại trừ các tính năng không được sử dụng. Trong trường hợp này, nếu chúng ta biên dịch ứng dụng cho production với `npm run build`, tệp `public/build/bundle.js` của chúng ta sẽ nặng khoảng 22 KB. Nếu chúng ta xóa chỉ thị `transitions:fly`, Svelte đủ thông minh để nhận ra rằng hàm fly không được sử dụng và kích thước tệp `bundle.js` sẽ giảm xuống còn khoảng 18 KB.

Đây chỉ là phần nổi của tảng băng. Svelte có nhiều tùy chọn để xử lý hoạt ảnh và transitions. Svelte cũng hỗ trợ chỉ định các transitions khác nhau để áp dụng khi phần tử được thêm hoặc xóa khỏi DOM với các chỉ thị `in:fn`/`out:fn`, và nó cũng cho phép bạn định nghĩa [CSS tùy chỉnh](https://learn.svelte.dev/tutorial/custom-css-transitions) và [JavaScript](https://learn.svelte.dev/tutorial/custom-js-transitions) transitions. Nó cũng có nhiều hàm easing để chỉ định tốc độ thay đổi theo thời gian. Hãy xem [ease visualizer](https://svelte.dev/examples/easing) để khám phá các hàm ease khác nhau có sẵn.

## Code cho đến nay

### Git

Để xem trạng thái của code như nó nên là ở cuối bài viết này, truy cập bản sao của repo của bạn như thế này:

```bash
cd mdn-svelte-tutorial/07-next-steps
```

Hoặc tải trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/07-next-steps
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Để xem trạng thái hiện tại của code trong REPL, hãy truy cập:

<https://svelte.dev/repl/378dd79e0dfe4486a8f10823f3813190?version=3.23.2>

## Tóm tắt

Trong bài viết này, chúng ta đã thêm hai tính năng mới: thành phần `Alert` và lưu trữ `todos` vào web storage.

- Điều này cho phép chúng ta giới thiệu một số kỹ thuật Svelte nâng cao. Chúng ta đã phát triển thành phần `Alert` để minh họa cách triển khai quản lý trạng thái giữa các thành phần bằng cách sử dụng stores. Chúng ta cũng đã thấy cách tự động đăng ký theo dõi stores để tích hợp liền mạch chúng với hệ thống khả năng phản ứng của Svelte.
- Sau đó chúng ta đã thấy cách triển khai store của riêng mình từ đầu, và cũng cách mở rộng writable store của Svelte để lưu dữ liệu vào web storage.
- Ở cuối chúng ta đã xem xét cách sử dụng chỉ thị `transition` của Svelte để triển khai hoạt ảnh trên các phần tử DOM.

Trong bài viết tiếp theo, chúng ta sẽ học cách thêm hỗ trợ TypeScript vào ứng dụng Svelte. Để tận dụng tất cả các tính năng của nó, chúng ta cũng sẽ chuyển toàn bộ ứng dụng sang TypeScript.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_reactivity_lifecycle_accessibility","Learn_web_development/Core/Frameworks_libraries/Svelte_TypeScript", "Learn_web_development/Core/Frameworks_libraries")}}
