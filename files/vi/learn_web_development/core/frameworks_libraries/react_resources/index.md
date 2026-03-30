---
title: Tài nguyên React
slug: Learn_web_development/Core/Frameworks_libraries/React_resources
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_accessibility","Learn_web_development/Core/Accessibility", "Learn_web_development/Core/Frameworks_libraries")}}

Bài viết cuối cùng của chúng ta cung cấp cho bạn danh sách các tài nguyên React mà bạn có thể sử dụng để tiếp tục học hỏi.

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
      <td>Quen thuộc với các tài nguyên bổ sung để tìm hiểu thêm về React.</td>
    </tr>
  </tbody>
</table>

## Kiểu dáng ở cấp độ thành phần

Trong khi chúng ta giữ tất cả CSS cho bài hướng dẫn trong một file `index.css` duy nhất, việc các ứng dụng React định nghĩa stylesheet theo từng thành phần là điều phổ biến. Trong một ứng dụng được cung cấp bởi Vite, điều này có thể được thực hiện bằng cách tạo một file CSS và import nó vào module thành phần tương ứng.

Ví dụ: chúng ta có thể đã viết một file `Form.css` chuyên dụng để chứa CSS liên quan đến thành phần `<Form />`, sau đó import các kiểu vào `Form.jsx`, như thế này:

```jsx
import Form from "./Form";
import "./Form.css";
```

Cách tiếp cận này giúp dễ dàng xác định và quản lý CSS thuộc về một thành phần cụ thể và phân biệt nó với các kiểu toàn ứng dụng của bạn. Tuy nhiên, nó cũng phân mảnh stylesheet của bạn trên toàn codebase, và sự phân mảnh này có thể không đáng. Đối với các ứng dụng lớn hơn với hàng trăm lượt xem riêng biệt và nhiều phần động, việc sử dụng kiểu ở cấp độ thành phần có ý nghĩa và do đó giới hạn lượng code không liên quan được gửi đến người dùng của bạn tại bất kỳ thời điểm nào.

Bạn có thể đọc thêm về điều này và các cách tiếp cận khác để tạo kiểu cho các thành phần React trong bài viết của Smashing Magazine, [Styling Components In React](https://www.smashingmagazine.com/2020/05/styling-components-react/).

## React DevTools

Chúng ta đã sử dụng `console.log()` để kiểm tra trạng thái và props của ứng dụng trong bài hướng dẫn này, và bạn cũng sẽ đã thấy một số cảnh báo và thông điệp lỗi hữu ích mà React cung cấp cho bạn cả trong CLI và console JavaScript của trình duyệt. Nhưng có nhiều điều hơn chúng ta có thể làm ở đây.

Tiện ích React DevTools cho phép bạn kiểm tra các nội bộ của ứng dụng React trực tiếp trong trình duyệt. Nó thêm một bảng mới vào công cụ dành cho nhà phát triển của trình duyệt cho phép bạn kiểm tra trạng thái và props của các thành phần khác nhau, và thậm chí chỉnh sửa trạng thái và props để thực hiện thay đổi ngay lập tức trong ứng dụng của bạn.

Ảnh chụp màn hình này hiển thị ứng dụng hoàn chỉnh của chúng ta như nó xuất hiện trong React DevTools:

![Our project being shown in React devtools](react-devtools.png)

Ở bên trái, chúng ta thấy tất cả các thành phần tạo nên ứng dụng của chúng ta, bao gồm các khóa duy nhất cho các mục được kết xuất từ mảng. Ở bên phải, chúng ta thấy các props và hook mà thành phần App của chúng ta sử dụng. Cũng lưu ý rằng các thành phần `Form`, `FilterButton` và `Todo` được thụt vào bên phải — điều này cho thấy `App` là thành phần cha của chúng. Chế độ xem này rất tuyệt vời để hiểu mối quan hệ cha/con trong nháy mắt và là vô giá khi hiểu các ứng dụng phức tạp hơn.

React DevTools có sẵn ở nhiều dạng:

- Một [tiện ích mở rộng trình duyệt Chrome](https://chromewebstore.google.com/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en).
- Một [tiện ích mở rộng trình duyệt Firefox](https://addons.mozilla.org/en-US/firefox/addon/react-devtools/).
- Một [tiện ích mở rộng trình duyệt Microsoft Edge](https://microsoftedge.microsoft.com/addons/detail/react-developer-tools/gpphkfbcpidddadnkolkpfckpihlkkil).
- Một [ứng dụng độc lập bạn có thể cài đặt với npm hoặc Yarn](https://www.npmjs.com/package/react-devtools).

Hãy thử cài đặt một trong số này, sau đó sử dụng nó để kiểm tra ứng dụng bạn vừa xây dựng!

Bạn có thể [đọc thêm về React DevTools trong tài liệu React](https://react.dev/learn/react-developer-tools).

## Hook `useReducer()`

Trong bài hướng dẫn này, chúng ta đã sử dụng hook `useState()` để quản lý trạng thái qua một tập hợp nhỏ các hàm xử lý sự kiện. Điều này ổn cho mục đích học tập, nhưng nó để lại logic quản lý trạng thái của chúng ta gắn liền với các trình xử lý sự kiện của thành phần — đặc biệt là những trình xử lý của thành phần `<Todo />`.

Hook `useReducer()` cung cấp cho nhà phát triển một cách để hợp nhất logic quản lý trạng thái khác nhau nhưng có liên quan vào một hàm duy nhất. Nó phức tạp hơn một chút so với `useState()`, nhưng đây là một công cụ tốt để có trong túi của bạn. Bạn có thể [đọc thêm về `useReducer()` trong tài liệu React](https://react.dev/learn/extracting-state-logic-into-a-reducer).

## Context API

Ứng dụng mà chúng ta xây dựng trong bài hướng dẫn này đã sử dụng props của thành phần để truyền dữ liệu từ thành phần `App` sang các thành phần con cần nó. Hầu hết thời gian, props là phương thức thích hợp để chia sẻ dữ liệu; tuy nhiên, đối với các ứng dụng phức tạp, lồng sâu, chúng không phải lúc nào cũng là tốt nhất.

React cung cấp [Context API](https://react.dev/learn/passing-data-deeply-with-context) như một cách để cung cấp dữ liệu cho các thành phần cần nó _mà không_ cần truyền props xuống cây thành phần. Cũng có [một hook useContext](https://react.dev/reference/react/useContext) tạo điều kiện cho điều này.

Nếu bạn muốn tự mình thử API này, Smashing Magazine đã viết một [bài viết giới thiệu về React context](https://www.smashingmagazine.com/2020/01/introduction-react-context-api/).

## Các thành phần lớp

Mặc dù bài hướng dẫn này không đề cập đến chúng, nhưng có thể xây dựng các thành phần React bằng cách sử dụng [các lớp JavaScript](/en-US/docs/Web/JavaScript/Reference/Classes) — những thành phần này được gọi là các thành phần lớp. Cho đến khi các hook ra đời, các lớp là cách duy nhất để đưa trạng thái vào các thành phần hoặc quản lý các tác dụng phụ của quá trình kết xuất. Chúng vẫn là cách duy nhất để xử lý một số trường hợp ngoại lệ nhất định, và chúng phổ biến trong các dự án React kế thừa. Tài liệu React chính thức duy trì tài liệu tham chiếu cho lớp cơ sở [`Component`](https://react.dev/reference/react/Component), nhưng khuyến nghị sử dụng hook để quản lý [trạng thái](https://react.dev/learn/state-a-components-memory) và [tác dụng phụ](https://react.dev/learn/synchronizing-with-effects).

## Kiểm thử

Các thư viện như [React Testing Library](https://testing-library.com/docs/react-testing-library/intro/) giúp viết các bài kiểm thử đơn vị cho các thành phần React. Có nhiều cách để _chạy_ các bài kiểm thử này. Framework kiểm thử [Vitest](https://vitest.dev/) được xây dựng trên Vite và là người bạn đồng hành tuyệt vời cho các ứng dụng React được cung cấp bởi Vite. [Jest](https://jestjs.io/) là một framework kiểm thử phổ biến khác có thể được sử dụng với React.

## Định tuyến

Trong khi định tuyến thường được xử lý bởi máy chủ chứ không phải ứng dụng trên máy tính của người dùng, nhưng có thể cấu hình một ứng dụng web để đọc và cập nhật vị trí của trình duyệt, và kết xuất các giao diện người dùng nhất định. Điều này được gọi là _định tuyến phía client_. Có thể tạo nhiều route độc đáo cho ứng dụng của bạn (chẳng hạn như `/home`, `/dashboard` hoặc `/login`).

[React Router](https://reactrouter.com/) là thư viện định tuyến phía client phổ biến nhất và mạnh mẽ nhất cho React. Nó cho phép các nhà phát triển định nghĩa các route của ứng dụng, và liên kết các thành phần với những route đó. Nó cũng cung cấp một số hook và thành phần hữu ích để quản lý vị trí và lịch sử của trình duyệt.

> [!NOTE]
> Định tuyến phía client có thể làm cho ứng dụng của bạn cảm thấy nhanh, nhưng nó đặt ra một số vấn đề về khả năng tiếp cận, đặc biệt là đối với những người dựa vào công nghệ hỗ trợ. Bạn có thể đọc thêm về điều này trong bài viết của Marcy Sutton, ["The Implications of Client-Side Routing"](https://testingaccessibility.com/implications-of-client-side-routing).

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_accessibility","Learn_web_development/Core/Accessibility", "Learn_web_development/Core/Frameworks_libraries")}}
