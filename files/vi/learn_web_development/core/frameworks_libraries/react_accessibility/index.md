---
title: Khả năng tiếp cận trong React
short-title: Khả năng tiếp cận React
slug: Learn_web_development/Core/Frameworks_libraries/React_accessibility
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_interactivity_filtering_conditional_rendering","Learn_web_development/Core/Frameworks_libraries/React_resources", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài hướng dẫn cuối cùng này, chúng ta sẽ tập trung (đúng nghĩa đen) vào khả năng tiếp cận, bao gồm quản lý tiêu điểm trong React, giúp cải thiện khả năng sử dụng và giảm bớt sự nhầm lẫn cho cả người dùng chỉ dùng bàn phím lẫn người dùng dùng công nghệ hỗ trợ.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a> và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>, cũng như <a href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line">terminal/dòng lệnh</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu học tập:</th>
      <td>Triển khai khả năng tiếp cận bàn phím trong React.</td>
    </tr>
  </tbody>
</table>

## Bao gồm người dùng bàn phím

Ở điểm này, chúng ta đã triển khai tất cả các tính năng mà chúng ta đề ra. Người dùng có thể thêm tác vụ mới, đánh dấu và bỏ đánh dấu tác vụ, xóa tác vụ hoặc chỉnh sửa tên tác vụ. Ngoài ra, họ có thể lọc danh sách tác vụ theo trạng thái tất cả, đang hoạt động hoặc đã hoàn thành.

Hay ít nhất là, họ có thể làm tất cả những điều này bằng chuột. Thật không may, những tính năng này không thực sự dễ tiếp cận đối với người dùng chỉ dùng bàn phím. Hãy cùng khám phá điều này ngay bây giờ.

## Khám phá vấn đề khả năng sử dụng bàn phím

Hãy bắt đầu bằng cách nhấp vào ô nhập liệu ở đầu ứng dụng của chúng ta, như thể bạn sắp thêm một tác vụ mới. Bạn sẽ thấy một đường viền dày, nét đứt xung quanh ô nhập liệu đó. Đường viền này là chỉ báo trực quan cho bạn biết rằng trình duyệt hiện đang tập trung vào phần tử này. Nhấn phím <kbd>Tab</kbd>, và bạn sẽ thấy đường viền xuất hiện xung quanh nút "Add" bên dưới ô nhập liệu. Điều này cho thấy tiêu điểm của trình duyệt đã di chuyển.

Nhấn <kbd>Tab</kbd> thêm vài lần, và bạn sẽ thấy chỉ báo tiêu điểm nét đứt này di chuyển giữa các nút lọc. Tiếp tục cho đến khi chỉ báo tiêu điểm nằm xung quanh nút "Edit" đầu tiên. Nhấn <kbd>Enter</kbd>.

Thành phần `<Todo />` sẽ chuyển đổi mẫu giao diện, như chúng ta đã thiết kế, và bạn sẽ thấy một biểu mẫu cho phép chỉnh sửa tên tác vụ.

Nhưng chỉ báo tiêu điểm của chúng ta đi đâu rồi?

Khi chúng ta chuyển đổi giữa các mẫu giao diện trong thành phần `<Todo />`, chúng ta hoàn toàn xóa các phần tử khỏi mẫu cũ và thay thế bằng các phần tử từ mẫu mới. Điều đó có nghĩa là phần tử mà chúng ta đang tập trung vào không còn tồn tại nữa, vì vậy không có tín hiệu trực quan nào cho biết tiêu điểm của trình duyệt đang ở đâu. Điều này có thể gây nhầm lẫn cho nhiều loại người dùng — đặc biệt là những người dựa vào bàn phím, hoặc những người sử dụng công nghệ hỗ trợ.

Để cải thiện trải nghiệm cho người dùng bàn phím và công nghệ hỗ trợ, chúng ta nên tự mình quản lý tiêu điểm của trình duyệt.

### Lưu ý bên lề: ghi chú về chỉ báo tiêu điểm của chúng ta

Nếu bạn nhấp vào nút lọc "All", "Active" hoặc "Completed" bằng chuột, bạn _sẽ không_ thấy chỉ báo tiêu điểm trực quan, nhưng bạn sẽ thấy nếu bạn di chuyển giữa chúng bằng phím <kbd>Tab</kbd> trên bàn phím. Đừng lo lắng — code của bạn không bị lỗi!

File CSS của chúng ta sử dụng lớp giả {{cssxref(":focus-visible")}} để cung cấp tạo kiểu tùy chỉnh cho chỉ báo tiêu điểm, và trình duyệt sử dụng một bộ quy tắc nội bộ để quyết định khi nào hiển thị nó cho người dùng. Thông thường, trình duyệt _sẽ_ hiển thị chỉ báo tiêu điểm khi nhận đầu vào từ bàn phím, và _có thể_ hiển thị khi nhận đầu vào từ chuột. Các phần tử `<button>` _không_ hiển thị chỉ báo tiêu điểm khi nhận đầu vào từ chuột, trong khi các phần tử `<input>` _có_.

Hành vi của `:focus-visible` có tính chọn lọc hơn so với lớp giả cũ {{cssxref(":focus")}} mà bạn có thể quen thuộc hơn. `:focus` hiển thị chỉ báo tiêu điểm trong nhiều tình huống hơn, và bạn có thể sử dụng nó thay thế hoặc kết hợp với `:focus-visible` nếu bạn thích.

## Tập trung giữa các mẫu giao diện

Khi người dùng thay đổi mẫu giao diện `<Todo />` từ chế độ xem sang chỉnh sửa, chúng ta nên tập trung vào `<input>` dùng để đổi tên; khi họ chuyển lại từ chỉnh sửa sang xem, chúng ta nên di chuyển tiêu điểm trở lại nút "Edit".

### Xác định các phần tử của chúng ta

Cho đến thời điểm này, chúng ta đã viết các thành phần JSX và để React xây dựng DOM kết quả ở phía sau. Hầu hết thời gian, chúng ta không cần xác định các phần tử cụ thể trong DOM vì chúng ta có thể sử dụng trạng thái và props của React để kiểm soát những gì được kết xuất. Tuy nhiên, để quản lý tiêu điểm, chúng ta _cần_ có khả năng xác định các phần tử DOM cụ thể.

Đây chính là lúc hook `useRef()` phát huy tác dụng.

Đầu tiên, thay đổi câu lệnh `import` ở đầu `Todo.jsx` để bao gồm `useRef`:

```jsx
import { useRef, useState } from "react";
```

`useRef()` tạo ra một đối tượng với một thuộc tính duy nhất: `current`. Các ref có thể lưu trữ bất kỳ giá trị nào chúng ta muốn, và chúng ta có thể tra cứu những giá trị đó sau. Chúng ta thậm chí có thể lưu trữ các tham chiếu đến các phần tử DOM, đó chính xác là điều chúng ta sẽ làm ở đây.

Tiếp theo, tạo hai hằng số mới bên dưới các hook `useState()` trong hàm `Todo()` của bạn. Mỗi hằng số nên là một ref — một cái cho nút "Edit" trong mẫu xem và một cái cho trường chỉnh sửa trong mẫu chỉnh sửa.

```jsx
const editFieldRef = useRef(null);
const editButtonRef = useRef(null);
```

Các ref này có giá trị mặc định là `null` để làm rõ rằng chúng sẽ trống cho đến khi được gắn vào các phần tử DOM tương ứng. Để gắn chúng vào các phần tử, chúng ta sẽ thêm thuộc tính `ref` đặc biệt vào JSX của mỗi phần tử, và đặt giá trị của các thuộc tính đó thành các đối tượng `ref` được đặt tên phù hợp.

Cập nhật `<input>` trong mẫu chỉnh sửa của bạn như sau:

```jsx
<input
  id={props.id}
  className="todo-text"
  type="text"
  value={newName}
  onChange={handleChange}
  ref={editFieldRef}
/>
```

Cập nhật nút "Edit" trong mẫu xem của bạn như sau:

```jsx
<button
  type="button"
  className="btn"
  onClick={() => setEditing(true)}
  ref={editButtonRef}>
  Edit <span className="visually-hidden">{props.name}</span>
</button>
```

Làm điều này sẽ điền vào `editFieldRef` và `editButtonRef` của chúng ta với các tham chiếu đến các phần tử DOM mà chúng được gắn vào, nhưng _chỉ_ sau khi React đã kết xuất thành phần. Hãy tự kiểm tra điều đó: thêm dòng sau vào đâu đó trong thân hàm `Todo()` của bạn, bên dưới nơi `editButtonRef` được khởi tạo:

```jsx
console.log(editButtonRef.current);
```

Bạn sẽ thấy rằng giá trị của `editButtonRef.current` là `null` khi thành phần lần đầu kết xuất, nhưng nếu bạn nhấp vào nút "Edit", nó sẽ ghi phần tử `<button>` vào console. Điều này là do ref chỉ được điền sau khi thành phần kết xuất, và việc nhấp vào nút "Edit" khiến thành phần kết xuất lại. Hãy chắc chắn xóa log này trước khi tiếp tục.

> [!NOTE]
> Logs của bạn sẽ xuất hiện 6 lần vì chúng ta có 3 instance của `<Todo />` trong ứng dụng và React kết xuất các thành phần của chúng ta hai lần trong môi trường phát triển.

Chúng ta đang tiến gần hơn! Để tận dụng các phần tử được tham chiếu mới, chúng ta cần sử dụng một hook React khác: `useEffect()`.

### Triển khai `useEffect()`

[`useEffect()`](https://react.dev/reference/react/useEffect) được đặt tên như vậy vì nó chạy bất kỳ tác dụng phụ nào mà chúng ta muốn thêm vào quá trình kết xuất nhưng không thể chạy bên trong thân hàm chính. `useEffect()` chạy ngay sau khi một thành phần kết xuất, có nghĩa là các phần tử DOM mà chúng ta đã tham chiếu trong phần trước sẽ có sẵn để chúng ta sử dụng.

Thay đổi câu lệnh import của `Todo.jsx` một lần nữa để thêm `useEffect`:

```jsx
import { useEffect, useRef, useState } from "react";
```

`useEffect()` nhận một hàm làm đối số; hàm này được thực thi _sau_ khi thành phần kết xuất. Để minh họa điều này, hãy đặt lệnh gọi `useEffect()` sau ngay trên câu lệnh `return` trong thân hàm `Todo()`, và truyền vào đó một hàm ghi từ "side effect" vào console:

```jsx
useEffect(() => {
  console.log("side effect");
});
```

Để minh họa sự khác biệt giữa quá trình kết xuất chính và code chạy bên trong `useEffect()`, hãy thêm một log khác — đặt cái này bên dưới phần bổ sung trước:

```jsx
console.log("main render");
```

Bây giờ, hãy mở ứng dụng trong trình duyệt. Bạn sẽ thấy cả hai thông điệp trong console, với mỗi cái lặp lại nhiều lần. Lưu ý cách "main render" ghi trước, và "side effect" ghi sau, mặc dù log "side effect" xuất hiện trước trong code.

```plain
main render                                     Todo.jsx
side effect                                     Todo.jsx
```

Một lần nữa, các log được sắp xếp theo cách này vì code bên trong `useEffect()` chạy _sau_ khi thành phần kết xuất. Điều này cần một chút thời gian để làm quen, hãy ghi nhớ điều đó khi bạn tiếp tục. Bây giờ, hãy xóa `console.log("main render")` và chúng ta sẽ tiến hành triển khai quản lý tiêu điểm.

### Tập trung vào trường chỉnh sửa

Bây giờ chúng ta biết hook `useEffect()` của mình hoạt động, chúng ta có thể quản lý tiêu điểm bằng nó. Như một lời nhắc nhở, chúng ta muốn tập trung vào trường chỉnh sửa khi chúng ta chuyển sang mẫu chỉnh sửa.

Cập nhật hook `useEffect()` hiện có của bạn như sau:

```jsx
useEffect(() => {
  if (isEditing) {
    editFieldRef.current.focus();
  }
}, [isEditing]);
```

Những thay đổi này làm cho, nếu `isEditing` là true, React đọc giá trị hiện tại của `editFieldRef` và di chuyển tiêu điểm trình duyệt đến nó. Chúng ta cũng truyền một mảng vào `useEffect()` như là đối số thứ hai. Mảng này là danh sách các giá trị mà `useEffect()` nên phụ thuộc vào. Với các giá trị này được bao gồm, `useEffect()` sẽ chỉ chạy khi một trong những giá trị đó thay đổi. Chúng ta chỉ muốn thay đổi tiêu điểm khi giá trị của `isEditing` thay đổi.

Hãy thử ngay bây giờ: sử dụng phím <kbd>Tab</kbd> để điều hướng đến một trong các nút "Edit", sau đó nhấn <kbd>Enter</kbd>. Bạn sẽ thấy thành phần `<Todo />` chuyển sang mẫu chỉnh sửa của nó, và chỉ báo tiêu điểm trình duyệt sẽ xuất hiện xung quanh phần tử `<input>`!

### Di chuyển tiêu điểm trở lại nút chỉnh sửa

Thoạt nhìn, việc khiến React di chuyển tiêu điểm trở lại nút "Edit" của chúng ta khi việc chỉnh sửa được lưu hoặc hủy bỏ có vẻ đơn giản một cách gian lận. Chắc chắn chúng ta có thể thêm một điều kiện vào `useEffect` để tập trung vào nút edit nếu `isEditing` là `false`? Hãy thử ngay bây giờ — cập nhật lệnh gọi `useEffect()` của bạn như sau:

```jsx
useEffect(() => {
  if (isEditing) {
    editFieldRef.current.focus();
  } else {
    editButtonRef.current.focus();
  }
}, [isEditing]);
```

Cái này hoạt động ở một mức độ nào đó. Nếu bạn sử dụng bàn phím để kích hoạt nút "Edit" (nhớ nhé: <kbd>Tab</kbd> đến nó và nhấn <kbd>Enter</kbd>), bạn sẽ thấy tiêu điểm di chuyển giữa `<input>` Chỉnh sửa và nút "Edit" khi bạn bắt đầu và kết thúc một lần chỉnh sửa. Tuy nhiên, bạn có thể đã nhận thấy một vấn đề mới — nút "Edit" trong thành phần `<Todo />` cuối cùng được tập trung ngay khi trang tải trước khi chúng ta thậm chí tương tác với ứng dụng!

Hook `useEffect()` của chúng ta đang hoạt động chính xác như chúng ta đã thiết kế: nó chạy ngay khi thành phần kết xuất, thấy rằng `isEditing` là `false`, và tập trung vào nút "Edit". Có ba instance của `<Todo />`, và tiêu điểm được trao cho nút "Edit" của cái kết xuất cuối cùng.

Chúng ta cần tái cấu trúc cách tiếp cận để tiêu điểm chỉ thay đổi khi `isEditing` thay đổi từ giá trị này sang giá trị khác.

## Quản lý tiêu điểm mạnh mẽ hơn

Để đáp ứng tiêu chí đã được tinh chỉnh, chúng ta cần biết không chỉ giá trị của `isEditing`, mà còn _khi nào giá trị đó đã thay đổi_. Để làm điều đó, chúng ta cần có thể đọc giá trị trước đó của hằng số `isEditing`. Sử dụng pseudocode, logic của chúng ta nên là như thế này:

```jsx
if (wasNotEditingBefore && isEditingNow) {
  focusOnEditField();
} else if (wasEditingBefore && isNotEditingNow) {
  focusOnEditButton();
}
```

Nhóm React đã thảo luận về [các cách để lấy trạng thái trước đó của thành phần](https://legacy.reactjs.org/docs/hooks-faq.html#how-to-get-the-previous-props-or-state), và cung cấp một hook ví dụ mà chúng ta có thể sử dụng cho công việc này.

### Giới thiệu `usePrevious()`

Dán đoạn code sau vào gần đầu `Todo.jsx`, phía trên hàm `Todo()` của bạn.

```jsx
function usePrevious(value) {
  const ref = useRef();
  useEffect(() => {
    ref.current = value;
  });
  return ref.current;
}
```

`usePrevious()` là một _hook tùy chỉnh_ theo dõi một giá trị qua các lần kết xuất. Nó:

1. Sử dụng hook `useRef()` để tạo một `ref` trống.
2. Trả về giá trị `current` của `ref` cho thành phần đã gọi nó.
3. Gọi `useEffect()` và cập nhật giá trị được lưu trong `ref.current` sau mỗi lần kết xuất của thành phần gọi.

Hành vi của `useEffect()` là chìa khóa cho chức năng này. Vì `ref.current` được cập nhật bên trong một lệnh gọi `useEffect()`, nó luôn đi sau một bước so với bất kỳ giá trị nào trong chu kỳ kết xuất chính của thành phần — do đó có tên là `usePrevious()`.

### Sử dụng `usePrevious()`

Bây giờ chúng ta có thể định nghĩa một hằng số `wasEditing` để theo dõi giá trị trước đó của `isEditing`; điều này được thực hiện bằng cách gọi `usePrevious` với `isEditing` làm đối số. Thêm phần sau vào trong `Todo()`, bên dưới các dòng `useRef`:

```jsx
const wasEditing = usePrevious(isEditing);
```

Bạn có thể thấy cách `usePrevious()` hoạt động bằng cách thêm một log console bên dưới dòng này:

```jsx
console.log(wasEditing);
```

Trong log này, giá trị `current` của `wasEditing` sẽ luôn là giá trị trước đó của `isEditing`. Nhấp vào nút "Edit" và "Cancel" vài lần để theo dõi sự thay đổi, sau đó xóa log này khi bạn sẵn sàng tiếp tục.

Với hằng số `wasEditing` này, chúng ta có thể cập nhật hook `useEffect()` để triển khai pseudocode chúng ta đã thảo luận trước đó:

```jsx
useEffect(() => {
  if (!wasEditing && isEditing) {
    editFieldRef.current.focus();
  } else if (wasEditing && !isEditing) {
    editButtonRef.current.focus();
  }
}, [wasEditing, isEditing]);
```

Lưu ý rằng logic của `useEffect()` bây giờ phụ thuộc vào `wasEditing`, vì vậy chúng ta cung cấp nó trong mảng phụ thuộc.

Hãy thử sử dụng bàn phím để kích hoạt các nút "Edit" và "Cancel" trong thành phần `<Todo />`; bạn sẽ thấy chỉ báo tiêu điểm trình duyệt di chuyển phù hợp, không có vấn đề mà chúng ta đã thảo luận ở đầu phần này.

## Tập trung khi người dùng xóa tác vụ

Có một khoảng trống trải nghiệm bàn phím cuối cùng: khi người dùng xóa một tác vụ khỏi danh sách, tiêu điểm biến mất. Chúng ta sẽ theo dõi một mô hình tương tự như những thay đổi trước của chúng ta: chúng ta sẽ tạo một ref mới và sử dụng hook `usePrevious()` của mình, để chúng ta có thể tập trung vào tiêu đề danh sách bất cứ khi nào người dùng xóa một tác vụ.

### Tại sao lại là tiêu đề danh sách?

Đôi khi, nơi chúng ta muốn gửi tiêu điểm đến là rõ ràng: khi chúng ta chuyển đổi các mẫu `<Todo />`, chúng ta có điểm xuất phát để "quay lại" — nút "Edit". Tuy nhiên trong trường hợp này, vì chúng ta hoàn toàn xóa các phần tử khỏi DOM, chúng ta không có nơi nào để quay lại. Lựa chọn tốt nhất tiếp theo là một vị trí trực quan nào đó gần đó. Tiêu đề danh sách là lựa chọn tốt nhất của chúng ta vì nó gần với mục danh sách mà người dùng sẽ xóa, và việc tập trung vào nó sẽ cho người dùng biết còn bao nhiêu tác vụ.

### Tạo ref của chúng ta

Import các hook `useRef()` và `useEffect()` vào `App.jsx` — bạn sẽ cần cả hai bên dưới:

```jsx
import { useState, useRef, useEffect } from "react";
```

Tiếp theo, khai báo một ref mới bên trong hàm `App()`, ngay phía trên câu lệnh `return`:

```jsx
const listHeadingRef = useRef(null);
```

### Chuẩn bị tiêu đề

Các phần tử tiêu đề như `<h2>` của chúng ta thường không thể nhận tiêu điểm. Điều này không phải là vấn đề — chúng ta có thể làm cho bất kỳ phần tử nào có thể nhận tiêu điểm theo cách lập trình bằng cách thêm thuộc tính [`tabindex="-1"`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) vào nó. Điều này có nghĩa là _chỉ có thể nhận tiêu điểm bằng JavaScript_. Bạn không thể nhấn <kbd>Tab</kbd> để tập trung vào một phần tử có tabindex là `-1` giống như bạn có thể làm với phần tử [`<button>`](/en-US/docs/Web/HTML/Reference/Elements/button) hoặc [`<a>`](/en-US/docs/Web/HTML/Reference/Elements/a) (điều này có thể được thực hiện bằng cách sử dụng `tabindex="0"`, nhưng đó không phải là phù hợp trong trường hợp này).

Hãy thêm thuộc tính `tabindex` — được viết là `tabIndex` trong JSX — vào tiêu đề phía trên danh sách tác vụ của chúng ta, cùng với `listHeadingRef`:

```jsx
<h2 id="list-heading" tabIndex="-1" ref={listHeadingRef}>
  {headingText}
</h2>
```

> [!NOTE]
> Thuộc tính `tabindex` rất tuyệt cho các trường hợp ngoại lệ về khả năng tiếp cận, nhưng bạn nên **rất cẩn thận** để không lạm dụng nó. Chỉ áp dụng `tabindex` cho một phần tử khi bạn chắc chắn rằng việc làm cho nó có thể nhận tiêu điểm sẽ mang lại lợi ích cho người dùng của bạn theo cách nào đó. Trong hầu hết các trường hợp, bạn nên sử dụng các phần tử có thể tự nhiên nhận tiêu điểm, chẳng hạn như button, anchor và input. Việc sử dụng `tabindex` không có trách nhiệm có thể tác động tiêu cực sâu sắc đến người dùng bàn phím và người dùng trình đọc màn hình!

### Lấy trạng thái trước đó

Chúng ta muốn tập trung vào phần tử được liên kết với ref của chúng ta (qua thuộc tính `ref`) chỉ khi người dùng của chúng ta xóa một tác vụ khỏi danh sách. Điều đó sẽ yêu cầu hook `usePrevious()` mà chúng ta đã sử dụng trước đó. Thêm nó vào đầu file `App.jsx` của bạn, ngay bên dưới các import:

```jsx
function usePrevious(value) {
  const ref = useRef();
  useEffect(() => {
    ref.current = value;
  });
  return ref.current;
}
```

Bây giờ thêm phần sau, phía trên câu lệnh `return` bên trong hàm `App()`:

```jsx
const prevTaskLength = usePrevious(tasks.length);
```

Ở đây chúng ta đang gọi `usePrevious()` để theo dõi độ dài trước đó của mảng tasks.

> [!NOTE]
> Vì bây giờ chúng ta đang sử dụng `usePrevious()` trong hai file, nên việc di chuyển hàm `usePrevious()` vào file riêng của nó, xuất nó từ file đó và import nó ở những nơi bạn cần có thể hiệu quả hơn. Hãy thử làm điều này như một bài tập sau khi bạn đến cuối.

### Sử dụng `useEffect()` để kiểm soát tiêu điểm tiêu đề của chúng ta

Bây giờ chúng ta đã lưu trữ số lượng tác vụ mà chúng ta đã có trước đó, chúng ta có thể thiết lập hook `useEffect()` để chạy khi số lượng tác vụ thay đổi, sẽ tập trung tiêu đề nếu số lượng tác vụ chúng ta có bây giờ ít hơn trước đây — tức là chúng ta đã xóa một tác vụ!

Thêm phần sau vào thân hàm `App()` của bạn, ngay bên dưới các phần bổ sung trước:

```jsx
useEffect(() => {
  if (tasks.length < prevTaskLength) {
    listHeadingRef.current.focus();
  }
}, [tasks.length, prevTaskLength]);
```

Chúng ta chỉ cố gắng tập trung vào tiêu đề danh sách nếu chúng ta có ít tác vụ hơn trước. Các phụ thuộc được truyền vào hook này đảm bảo nó sẽ chỉ cố gắng chạy lại khi một trong hai giá trị đó (số lượng tác vụ hiện tại, hoặc số lượng tác vụ trước đó) thay đổi.

Bây giờ, khi bạn sử dụng bàn phím để xóa một tác vụ trong trình duyệt, bạn sẽ thấy đường viền tiêu điểm nét đứt của chúng ta xuất hiện xung quanh tiêu đề phía trên danh sách.

## Hoàn thành!

Bạn vừa hoàn thành việc xây dựng một ứng dụng React từ đầu! Chúc mừng! Các kỹ năng bạn đã học ở đây sẽ là nền tảng tuyệt vời để phát triển khi bạn tiếp tục làm việc với React.

Hầu hết thời gian, bạn có thể là người đóng góp hiệu quả cho một dự án React ngay cả khi tất cả những gì bạn làm là suy nghĩ cẩn thận về các thành phần và trạng thái và props của chúng. Hãy nhớ luôn viết HTML tốt nhất mà bạn có thể.

`useRef()` và `useEffect()` là những tính năng khá nâng cao, và bạn nên tự hào về bản thân khi đã sử dụng chúng! Hãy tìm kiếm cơ hội để thực hành chúng nhiều hơn, vì làm như vậy sẽ cho phép bạn tạo ra những trải nghiệm toàn diện cho người dùng. Hãy nhớ: ứng dụng của chúng ta sẽ không thể tiếp cận được với người dùng bàn phím nếu không có chúng!

> [!NOTE]
> Nếu bạn cần kiểm tra code của mình so với phiên bản của chúng tôi, bạn có thể tìm thấy phiên bản hoàn chỉnh của code ứng dụng React mẫu trong [kho lưu trữ todo-react](https://github.com/mdn/todo-react). Để xem phiên bản trực tiếp đang chạy, hãy xem <https://mdn.github.io/todo-react/>.

Trong bài viết cuối cùng, chúng tôi sẽ cung cấp cho bạn danh sách các tài nguyên React mà bạn có thể sử dụng để tiếp tục học hỏi.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_interactivity_filtering_conditional_rendering","Learn_web_development/Core/Frameworks_libraries/React_resources", "Learn_web_development/Core/Frameworks_libraries")}}
