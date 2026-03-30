---
title: Tham chiếu Vue và phương thức vòng đời để quản lý tiêu điểm
slug: Learn_web_development/Core/Frameworks_libraries/Vue_refs_focus_management
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_conditional_rendering","Learn_web_development/Core/Frameworks_libraries/Vue_resources", "Learn_web_development/Core/Frameworks_libraries")}}

Chúng ta gần như hoàn thành với Vue. Tính năng chức năng cuối cùng cần xem xét là quản lý tiêu điểm, hay nói cách khác, cách chúng ta có thể cải thiện khả năng tiếp cận bàn phím của ứng dụng. Chúng ta sẽ xem xét việc sử dụng **Vue refs** để xử lý điều này — một tính năng nâng cao cho phép bạn truy cập trực tiếp vào các node DOM bên dưới DOM ảo, hoặc truy cập trực tiếp từ một thành phần vào cấu trúc DOM nội bộ của một thành phần con.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a> và
          <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
          kiến thức về
          <a
            href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/dòng lệnh</a
          >.
        </p>
        <p>
          Các thành phần Vue được viết như một sự kết hợp của các đối tượng JavaScript quản lý dữ liệu của ứng dụng và cú pháp mẫu dựa trên HTML ánh xạ tới cấu trúc DOM bên dưới. Để cài đặt và sử dụng một số tính năng nâng cao hơn của Vue (như Single File Components hoặc render functions), bạn sẽ cần một terminal có node + npm được cài đặt.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Tìm hiểu cách xử lý quản lý tiêu điểm bằng Vue refs.</td>
    </tr>
  </tbody>
</table>

## Vấn đề quản lý tiêu điểm

Mặc dù chúng ta có chức năng chỉnh sửa hoạt động, nhưng chúng ta không cung cấp trải nghiệm tốt cho người dùng không dùng chuột. Cụ thể, khi người dùng kích hoạt nút "Edit", chúng ta xóa nút "Edit" khỏi DOM, nhưng chúng ta không di chuyển tiêu điểm của người dùng đến bất cứ đâu, vì vậy nó thực sự chỉ biến mất. Điều này có thể gây mất phương hướng cho người dùng bàn phím và người dùng không thể nhìn thấy.

Để hiểu những gì hiện đang xảy ra:

1. Tải lại trang, sau đó nhấn <kbd>Tab</kbd>. Bạn sẽ thấy đường viền tiêu điểm trên input để thêm các mục todo mới.

2. Nhấn <kbd>Tab</kbd> lại. Tiêu điểm sẽ di chuyển đến nút "Add".

3. Nhấn nó lần nữa, và nó sẽ ở checkbox đầu tiên. Thêm một lần nữa, và tiêu điểm sẽ ở nút "Edit" đầu tiên.
4. Kích hoạt nút "Edit" bằng cách nhấn <kbd>Enter</kbd>.
   Checkbox sẽ được thay thế bằng thành phần chỉnh sửa, nhưng đường viền tiêu điểm sẽ biến mất.

Hành vi này có thể gây bất ngờ. Ngoài ra, điều gì xảy ra khi bạn nhấn <kbd>Tab</kbd> lại khác nhau tùy thuộc vào trình duyệt bạn đang sử dụng. Tương tự, nếu bạn lưu hoặc hủy chỉnh sửa, tiêu điểm sẽ biến mất lại khi bạn di chuyển về chế độ xem không chỉnh sửa.

Để cung cấp trải nghiệm tốt hơn cho người dùng, chúng ta sẽ thêm code để kiểm soát tiêu điểm sao cho nó được đặt vào trường chỉnh sửa khi biểu mẫu chỉnh sửa được hiển thị. Chúng ta cũng muốn đặt tiêu điểm trở lại nút "Edit" khi người dùng hủy hoặc lưu chỉnh sửa của họ. Để đặt tiêu điểm, chúng ta cần hiểu thêm một chút về cách Vue hoạt động nội bộ.

## DOM ảo và refs

Vue, giống như một số framework khác, sử dụng DOM ảo (VDOM) để quản lý các phần tử. Điều này có nghĩa là Vue giữ một biểu diễn của tất cả các node trong ứng dụng của chúng ta trong bộ nhớ. Bất kỳ cập nhật nào đều được thực hiện đầu tiên trên các node trong bộ nhớ, và sau đó tất cả các thay đổi cần được thực hiện với các node thực tế trên trang được đồng bộ theo lô.

Vì việc đọc và ghi các node DOM thực tế thường tốn kém hơn so với các node ảo, điều này có thể dẫn đến hiệu suất tốt hơn. Tuy nhiên, điều này cũng có nghĩa là bạn thường không nên chỉnh sửa trực tiếp các phần tử HTML của mình thông qua các API trình duyệt gốc (như [`Document.getElementById`](/en-US/docs/Web/API/Document/getElementById)) khi sử dụng các framework, vì nó dẫn đến VDOM và DOM thực đi không đồng bộ.

Thay vào đó, nếu bạn cần truy cập các node DOM bên dưới (như khi đặt tiêu điểm), bạn có thể sử dụng [Vue refs](https://vuejs.org/guide/essentials/template-refs.html). Đối với các thành phần Vue tùy chỉnh, bạn cũng có thể sử dụng refs để truy cập trực tiếp cấu trúc nội bộ của một thành phần con, tuy nhiên điều này nên được thực hiện một cách thận trọng vì nó có thể làm cho code khó lý luận và hiểu hơn.

Để sử dụng ref trong một thành phần, bạn thêm thuộc tính `ref` vào phần tử bạn muốn truy cập, với một định danh chuỗi cho giá trị của thuộc tính. Điều quan trọng cần lưu ý là một ref cần phải là duy nhất trong một thành phần. Không có hai phần tử được kết xuất cùng một lúc nên có cùng ref.

### Thêm ref vào ứng dụng của chúng ta

Vậy, hãy gắn một ref vào nút "Edit" của chúng ta trong `ToDoItem.vue`. Cập nhật nó như thế này:

```vue
<button
  type="button"
  class="btn"
  ref="editButton"
  @click="toggleToItemEditForm">
  Edit
  <span class="visually-hidden">\{{label}}</span>
</button>
```

Để truy cập giá trị liên kết với ref của chúng ta, chúng ta sử dụng thuộc tính `$refs` được cung cấp trên instance thành phần. Để xem giá trị của ref khi chúng ta nhấp vào nút "Edit", thêm `console.log()` vào phương thức `toggleToItemEditForm()`, như sau:

```js
export default {
  // …
  methods: {
    // …
    toggleToItemEditForm() {
      console.log(this.$refs.editButton);
      this.isEditing = true;
    },
    // …
  },
  // …
};
```

Nếu bạn kích hoạt nút "Edit" tại thời điểm này, bạn sẽ thấy một phần tử HTML `<button>` được tham chiếu trong console.

## Phương thức $nextTick() của Vue

Chúng ta muốn đặt tiêu điểm vào nút "Edit" khi người dùng lưu hoặc hủy chỉnh sửa của họ. Để làm điều đó, chúng ta cần xử lý tiêu điểm trong các phương thức `itemEdited()` và `editCancelled()` của thành phần `ToDoItem`.

Để tiện lợi, hãy tạo một phương thức mới không nhận đối số gọi là `focusOnEditButton()`. Bên trong nó, gán `ref` của bạn vào một biến, sau đó gọi phương thức `focus()` trên ref.

```js
export default {
  // …
  methods: {
    // …
    focusOnEditButton() {
      const editButtonRef = this.$refs.editButton;
      editButtonRef.focus();
    },
    // …
  },
  // …
};
```

Tiếp theo, thêm lệnh gọi `this.focusOnEditButton()` ở cuối các phương thức `itemEdited()` và `editCancelled()`:

```js
export default {
  // …
  methods: {
    // …
    itemEdited(newItemName) {
      this.$emit("item-edited", newItemName);
      this.isEditing = false;
      this.focusOnEditButton();
    },
    editCancelled() {
      this.isEditing = false;
      this.focusOnEditButton();
    },
    // …
  },
  // …
};
```

Hãy thử chỉnh sửa và sau đó lưu/hủy một mục todo qua bàn phím. Bạn sẽ nhận thấy rằng tiêu điểm không được đặt, vì vậy chúng ta vẫn còn vấn đề cần giải quyết. Nếu bạn mở console, bạn sẽ thấy một lỗi được đưa ra tương tự như _"can't access property "focus", editButtonRef is undefined"_. Điều này có vẻ kỳ lạ. Ref nút của bạn đã được định nghĩa khi bạn kích hoạt nút "Edit", nhưng bây giờ nó không còn. Điều gì đang xảy ra?

Vâng, hãy nhớ rằng khi chúng ta thay đổi `isEditing` thành `true`, chúng ta không còn kết xuất phần của thành phần có nút "Edit". Điều này có nghĩa là không có phần tử nào để ràng buộc ref, vì vậy nó trở thành `undefined`.

Bạn có thể đang nghĩ "này, chúng ta có đặt `isEditing=false` trước khi chúng ta cố gắng truy cập `ref` không, vì vậy `v-if` bây giờ có nên hiển thị nút không?" Đây là lúc DOM ảo phát huy tác dụng. Vì Vue đang cố gắng tối ưu hóa và gộp các thay đổi, nó sẽ không cập nhật DOM ngay lập tức khi chúng ta đặt `isEditing` thành `false`. Vì vậy, khi chúng ta gọi `focusOnEditButton()`, nút "Edit" chưa được kết xuất.

Thay vào đó, chúng ta cần chờ cho đến khi Vue trải qua chu kỳ cập nhật DOM tiếp theo. Để làm điều đó, các thành phần Vue có một phương thức đặc biệt gọi là `$nextTick()`. Phương thức này chấp nhận một hàm callback, sau đó thực thi sau khi DOM cập nhật.

Vì phương thức `focusOnEditButton()` cần được gọi sau khi DOM đã cập nhật, chúng ta có thể bao gồm phần thân hàm hiện có bên trong một lệnh gọi `$nextTick()`.

```js
export default {
  // …
  methods: {
    // …
    focusOnEditButton() {
      this.$nextTick(() => {
        const editButtonRef = this.$refs.editButton;
        editButtonRef.focus();
      });
    },
    // …
  },
  // …
};
```

Bây giờ khi bạn kích hoạt nút "Edit" và sau đó hủy hoặc lưu thay đổi qua bàn phím, tiêu điểm sẽ được trả về nút "Edit". Thành công!

## Các phương thức vòng đời Vue

Tiếp theo, chúng ta cần di chuyển tiêu điểm đến phần tử `<input>` của biểu mẫu chỉnh sửa khi nút "Edit" được nhấp. Tuy nhiên, vì biểu mẫu chỉnh sửa của chúng ta ở trong một thành phần khác với nút "Edit", chúng ta không thể chỉ đặt tiêu điểm bên trong trình xử lý sự kiện nhấp của nút "Edit". Thay vào đó, chúng ta có thể sử dụng thực tế là chúng ta xóa và gắn lại thành phần `ToDoItemEditForm` bất cứ khi nào nút "Edit" được nhấp để xử lý điều này.

Vậy nó hoạt động như thế nào? Vâng, các thành phần Vue trải qua một chuỗi sự kiện, được gọi là **vòng đời**. Vòng đời này trải dài từ trước khi các phần tử được _tạo_ và thêm vào VDOM (_mounted_), cho đến khi chúng được xóa khỏi VDOM (_destroyed_).

Vue cho phép bạn chạy các phương thức ở các giai đoạn khác nhau của vòng đời này bằng cách sử dụng **phương thức vòng đời**. Điều này có thể hữu ích cho những thứ như tải dữ liệu, nơi bạn có thể cần lấy dữ liệu trước khi thành phần kết xuất, hoặc sau khi một thuộc tính thay đổi. Danh sách các phương thức vòng đời ở bên dưới, theo thứ tự chúng kích hoạt.

1. `beforeCreate()` — Chạy trước khi instance thành phần của bạn được tạo. Dữ liệu và sự kiện chưa có sẵn.
2. `created()` — Chạy sau khi thành phần của bạn được khởi tạo nhưng trước khi thành phần được thêm vào VDOM. Đây thường là nơi xảy ra tải dữ liệu.
3. `beforeMount()` — Chạy sau khi mẫu của bạn được biên dịch, nhưng trước khi thành phần được kết xuất lên DOM thực tế.
4. `mounted()` — Chạy sau khi thành phần của bạn được gắn vào DOM. Có thể truy cập `refs` ở đây.
5. `beforeUpdate()` — Chạy bất cứ khi nào dữ liệu trong thành phần của bạn thay đổi, nhưng trước khi các thay đổi được kết xuất lên DOM.
6. `updated()` — Chạy bất cứ khi nào dữ liệu trong thành phần của bạn đã thay đổi và sau khi các thay đổi được kết xuất lên DOM.
7. `beforeDestroy()` — Chạy trước khi một thành phần bị xóa khỏi DOM.
8. `destroyed()` — Chạy sau khi một thành phần đã bị xóa khỏi DOM.
9. `activated()` — Chỉ được sử dụng trong các thành phần được bao bọc trong thẻ `keep-alive` đặc biệt. Chạy sau khi thành phần được kích hoạt.
10. `deactivated()` — Chỉ được sử dụng trong các thành phần được bao bọc trong thẻ `keep-alive` đặc biệt. Chạy sau khi thành phần bị hủy kích hoạt.

> [!NOTE]
> Tài liệu Vue cung cấp một [sơ đồ đẹp để hiển thị khi nào các hook này xảy ra](https://vuejs.org/guide/essentials/lifecycle.html#lifecycle-diagram). Bài viết này từ [DigitalOcean Community Blog đi sâu hơn vào các phương thức vòng đời](https://www.digitalocean.com/community/tutorials/vuejs-component-lifecycle).

Bây giờ chúng ta đã xem qua các phương thức vòng đời, hãy sử dụng một cái để kích hoạt tiêu điểm khi thành phần `ToDoItemEditForm` được gắn.

Trong `ToDoItemEditForm.vue`, gắn `ref="labelInput"` vào phần tử `<input>`, như sau:

```vue
<input
  :id="id"
  ref="labelInput"
  type="text"
  autocomplete="off"
  v-model.lazy.trim="newName" />
```

Tiếp theo, thêm thuộc tính `mounted()` ngay bên trong đối tượng thành phần — **lưu ý rằng điều này không nên được đặt bên trong thuộc tính `methods`, mà ở cùng cấp độ phân cấp với `props`, `data()` và `methods`.** Các phương thức vòng đời là các phương thức đặc biệt nằm một mình, không cùng với các phương thức người dùng định nghĩa. Điều này không nên nhận đầu vào. Lưu ý rằng bạn không thể sử dụng arrow function ở đây vì chúng ta cần truy cập vào `this` để truy cập ref `labelInput`.

```js
export default {
  // …
  mounted() {},
  // …
};
```

Bên trong phương thức `mounted()` của bạn, gán ref `labelInput` vào một biến, sau đó gọi hàm `focus()` của ref. Bạn không cần sử dụng `$nextTick()` ở đây vì thành phần đã được thêm vào DOM khi `mounted()` được gọi.

```js
export default {
  // …
  mounted() {
    const labelInputRef = this.$refs.labelInput;
    labelInputRef.focus();
  },
  // …
};
```

Bây giờ khi bạn kích hoạt nút "Edit" bằng bàn phím, tiêu điểm sẽ ngay lập tức di chuyển đến `<input>` chỉnh sửa.

## Xử lý tiêu điểm khi xóa mục todo

Còn một nơi nữa chúng ta cần xem xét quản lý tiêu điểm: khi người dùng xóa một mục todo. Khi nhấp vào nút "Edit", có ý nghĩa di chuyển tiêu điểm đến hộp văn bản tên chỉnh sửa, và trở lại nút "Edit" khi hủy hoặc lưu từ màn hình chỉnh sửa.

Tuy nhiên, không giống như với biểu mẫu chỉnh sửa, chúng ta không có vị trí rõ ràng để tiêu điểm di chuyển đến khi một phần tử bị xóa. Chúng ta cũng cần một cách để cung cấp cho người dùng công nghệ hỗ trợ thông tin xác nhận rằng một phần tử đã bị xóa.

Chúng ta đã theo dõi số lượng phần tử trong tiêu đề danh sách — `<h2>` trong `App.vue` — và nó liên quan đến danh sách các mục todo của chúng ta. Điều này làm cho nó là một nơi hợp lý để di chuyển tiêu điểm đến khi chúng ta xóa một node.

Đầu tiên, chúng ta cần thêm ref vào tiêu đề danh sách. Chúng ta cũng cần thêm `tabindex="-1"` vào nó — điều này làm cho phần tử có thể nhận tiêu điểm theo cách lập trình (tức là, nó có thể được tập trung qua JavaScript), khi theo mặc định nó không thể.

Bên trong `App.vue`, cập nhật `<h2>` của bạn như sau:

```vue
<h2 id="list-summary" ref="listSummary" tabindex="-1">\{{listSummary}}</h2>
```

> [!NOTE]
> [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) là một công cụ thực sự mạnh mẽ để xử lý một số vấn đề khả năng tiếp cận nhất định. Tuy nhiên, nó nên được sử dụng một cách thận trọng. Lạm dụng `tabindex="-1"` có thể gây ra vấn đề cho tất cả các loại người dùng, vì vậy chỉ sử dụng nó chính xác ở những nơi bạn cần. Bạn cũng hầu như không bao giờ nên sử dụng `tabindex` >= `0`, vì nó có thể gây ra vấn đề cho người dùng vì nó có thể làm cho luồng DOM và thứ tự tab không khớp, và/hoặc thêm các phần tử không tương tác vào thứ tự tab. Điều này có thể gây nhầm lẫn cho người dùng, đặc biệt là những người sử dụng trình đọc màn hình và công nghệ hỗ trợ khác.

Bây giờ chúng ta có `ref` và cho trình duyệt biết rằng chúng ta có thể tập trung `<h2>` theo cách lập trình, chúng ta cần đặt tiêu điểm vào nó. Ở cuối `deleteToDo()`, sử dụng ref `listSummary` để đặt tiêu điểm trên `<h2>`. Vì `<h2>` luôn được kết xuất trong ứng dụng, bạn không cần lo lắng về việc sử dụng `$nextTick()` hoặc các phương thức vòng đời để xử lý việc tập trung vào nó.

```js
export default {
  // …
  methods: {
    // …
    deleteToDo(toDoId) {
      const itemIndex = this.ToDoItems.findIndex((item) => item.id === toDoId);
      this.ToDoItems.splice(itemIndex, 1);
      this.$refs.listSummary.focus();
    },
    // …
  },
  // …
};
```

Bây giờ, khi bạn xóa một mục khỏi danh sách, tiêu điểm sẽ được di chuyển lên tiêu đề danh sách. Điều này sẽ cung cấp trải nghiệm tiêu điểm hợp lý cho tất cả người dùng của chúng ta.

## Tóm tắt

Đó là tất cả về quản lý tiêu điểm và ứng dụng của chúng ta! Chúc mừng vì đã làm việc qua tất cả các hướng dẫn Vue của chúng ta. Trong bài viết tiếp theo, chúng ta sẽ kết thúc mọi thứ với một số tài nguyên bổ sung để đưa việc học Vue của bạn đi xa hơn.

> [!NOTE]
> Nếu bạn cần kiểm tra code của mình so với phiên bản của chúng tôi, bạn có thể tìm thấy phiên bản hoàn chỉnh của code ứng dụng Vue mẫu trong kho lưu trữ todo-vue. Để xem phiên bản trực tiếp đang chạy, hãy xem <https://mdn.github.io/todo-vue/>.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_conditional_rendering","Learn_web_development/Core/Frameworks_libraries/Vue_resources", "Learn_web_development/Core/Frameworks_libraries")}}
