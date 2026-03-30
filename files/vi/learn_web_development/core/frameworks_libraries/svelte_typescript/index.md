---
title: Hỗ trợ TypeScript trong Svelte
slug: Learn_web_development/Core/Frameworks_libraries/Svelte_TypeScript
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_stores","Learn_web_development/Core/Frameworks_libraries/Svelte_deployment_next", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài viết trước, chúng ta đã học về Svelte stores và thậm chí đã triển khai store tùy chỉnh của riêng mình để lưu trữ thông tin của ứng dụng vào Web Storage. Chúng ta cũng đã xem cách sử dụng chỉ thị transition để triển khai hoạt ảnh trên các phần tử DOM trong Svelte.

Bây giờ chúng ta sẽ học cách sử dụng TypeScript trong các ứng dụng Svelte. Đầu tiên chúng ta sẽ học TypeScript là gì và những lợi ích nó có thể mang lại. Sau đó chúng ta sẽ xem cách cấu hình dự án để làm việc với các tệp TypeScript. Cuối cùng chúng ta sẽ xem qua ứng dụng và xem những thay đổi nào chúng ta phải thực hiện để tận dụng đầy đủ các tính năng của TypeScript.

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
      <td>
        Học cách cấu hình và sử dụng TypeScript khi phát triển ứng dụng Svelte.
      </td>
    </tr>
  </tbody>
</table>

Lưu ý rằng ứng dụng của chúng ta hoàn toàn có chức năng, và việc chuyển sang TypeScript hoàn toàn là tùy chọn. Có những ý kiến khác nhau về vấn đề này, và trong chương này chúng ta sẽ nói ngắn gọn về ưu và nhược điểm của việc sử dụng TypeScript. Ngay cả khi bạn không có kế hoạch áp dụng nó, bài viết này sẽ hữu ích để cho phép bạn tìm hiểu những gì nó cung cấp và giúp bạn đưa ra quyết định của riêng mình. Nếu bạn không quan tâm đến TypeScript, bạn có thể bỏ qua chương tiếp theo, nơi chúng ta sẽ xem xét các tùy chọn khác nhau để triển khai ứng dụng Svelte, các tài nguyên bổ sung và nhiều hơn nữa.

## Lập trình cùng chúng tôi

### Git

Clone repo GitHub (nếu bạn chưa làm) với:

```bash
git clone https://github.com/opensas/mdn-svelte-tutorial.git
```

Sau đó để đến trạng thái ứng dụng hiện tại, chạy

```bash
cd mdn-svelte-tutorial/07-typescript-support
```

Hoặc tải trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/07-typescript-support
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Thật không may, [hỗ trợ TypeScript chưa có sẵn trong REPL](https://github.com/sveltejs/svelte.dev/issues/853).

## TypeScript: kiểu tĩnh tùy chọn cho JavaScript

[TypeScript](https://www.typescriptlang.org/) là một superset của JavaScript cung cấp các tính năng như kiểu tĩnh tùy chọn, class, interface, và generics. Mục tiêu của TypeScript là giúp phát hiện lỗi sớm thông qua hệ thống kiểu và làm cho việc phát triển JavaScript hiệu quả hơn. Một trong những lợi ích lớn là cho phép IDE cung cấp môi trường phong phú hơn để phát hiện các lỗi phổ biến khi bạn gõ code.

Tốt nhất là, code JavaScript là code TypeScript hợp lệ; TypeScript là superset của JavaScript. Bạn có thể đổi tên hầu hết các tệp `.js` sang `.ts` và chúng sẽ hoạt động bình thường.

Code TypeScript của chúng ta sẽ có thể chạy ở bất cứ đâu JavaScript có thể chạy. Điều đó có thể như thế nào? TypeScript "transpile" code của chúng ta sang JavaScript thuần túy. Điều đó có nghĩa là nó phân tích code TypeScript và tạo ra code JavaScript thuần túy tương đương để trình duyệt chạy.

> [!NOTE]
> Nếu bạn tò mò về cách TypeScript transpile code của chúng ta sang JavaScript, bạn có thể xem [TypeScript Playground](https://www.typescriptlang.org/play/?target=1&e=4#example/hello-world).

Hỗ trợ TypeScript đầy đủ đã là tính năng được yêu cầu nhiều nhất của Svelte trong một thời gian khá dài. Nhờ công sức của nhóm Svelte, cùng với nhiều đóng góp viên, họ có một [giải pháp chính thức](https://svelte.dev/blog/svelte-and-typescript) sẵn sàng để thử nghiệm. Trong phần này chúng ta sẽ chỉ cho bạn cách thiết lập một dự án Svelte với hỗ trợ TypeScript để thử.

## Tại sao TypeScript?

Các ưu điểm chính của TypeScript là:

- Phát hiện lỗi sớm: Trình biên dịch kiểm tra kiểu tại thời điểm biên dịch và cung cấp báo cáo lỗi.
- Khả năng đọc: Kiểu tĩnh cung cấp cho code nhiều cấu trúc hơn, giúp nó tự tài liệu và dễ đọc hơn.
- Hỗ trợ IDE phong phú: Thông tin kiểu cho phép các code editor và IDE cung cấp các tính năng như điều hướng code, tự động hoàn thành và gợi ý thông minh hơn.
- Tái cấu trúc an toàn hơn: Kiểu cho phép IDE biết nhiều hơn về code của bạn, và hỗ trợ bạn trong khi tái cấu trúc các phần lớn của codebase.
- Suy luận kiểu: Cho phép bạn tận dụng nhiều tính năng TypeScript ngay cả khi không khai báo kiểu biến.
- Khả dụng của các tính năng JavaScript mới và trong tương lai: TypeScript transpile nhiều tính năng JavaScript gần đây sang JavaScript cổ điển thuần túy, cho phép bạn sử dụng chúng ngay cả trên các user-agent chưa hỗ trợ natively.

TypeScript cũng có một số nhược điểm:

- Không phải kiểu tĩnh thực sự: Kiểu chỉ được kiểm tra tại thời điểm biên dịch, và chúng bị loại bỏ khỏi code được tạo ra.
- Đường cong học tập dốc: Mặc dù TypeScript là superset của JavaScript và không phải là ngôn ngữ hoàn toàn mới, nhưng có một đường cong học tập đáng kể, đặc biệt nếu bạn không có kinh nghiệm với các ngôn ngữ tĩnh như Java hoặc C#.
- Nhiều code hơn: Bạn phải viết và duy trì nhiều code hơn.
- Không thay thế cho kiểm thử tự động: Mặc dù kiểu có thể giúp bạn phát hiện một số lỗi, TypeScript không phải là sự thay thế thực sự cho một bộ kiểm thử tự động toàn diện.
- Code boilerplate: Làm việc với kiểu, class, interface, và generics có thể dẫn đến codebase được kỹ thuật hóa quá mức.

Có vẻ như có sự đồng thuận rộng rãi rằng TypeScript đặc biệt phù hợp cho các dự án quy mô lớn, với nhiều nhà phát triển làm việc trên cùng codebase. Và thực sự nó đang được sử dụng bởi một số dự án quy mô lớn, như Angular 2, Vue 3, Ionic, Visual Studio Code, Jest, và thậm chí trình biên dịch Svelte. Tuy nhiên, một số nhà phát triển thích sử dụng nó ngay cả trên các dự án nhỏ như dự án chúng ta đang phát triển.

Cuối cùng, đó là quyết định của bạn. Trong các phần sau, chúng ta hy vọng cung cấp cho bạn thêm bằng chứng để đưa ra quyết định.

## Tạo dự án Svelte TypeScript từ đầu

Bạn có thể bắt đầu một dự án Svelte TypeScript mới bằng cách sử dụng [template chuẩn](https://github.com/sveltejs/template). Tất cả những gì bạn phải làm là chạy các lệnh terminal sau (chạy chúng ở nơi bạn đang lưu trữ các dự án thử nghiệm Svelte — nó tạo một thư mục mới):

```bash
npx degit sveltejs/template svelte-typescript-app

cd svelte-typescript-app

node scripts/setupTypeScript.js
```

Điều này tạo một dự án starter bao gồm hỗ trợ TypeScript, mà bạn có thể tùy chỉnh theo ý muốn.

Sau đó bạn sẽ phải yêu cầu npm tải xuống các dependencies và khởi động dự án ở chế độ phát triển, như thường làm:

```bash
npm install

npm run dev
```

## Thêm hỗ trợ TypeScript vào dự án Svelte hiện có

Để thêm hỗ trợ TypeScript vào một dự án Svelte hiện có, bạn có thể [làm theo các hướng dẫn này](https://svelte.dev/blog/svelte-and-typescript#Adding_TypeScript_to_an_existing_project). Ngoài ra, bạn có thể tải xuống tệp [`setupTypeScript.js`](https://github.com/sveltejs/template/blob/master/scripts/setupTypeScript.js) vào thư mục `scripts` bên trong thư mục gốc của dự án, và sau đó chạy `node scripts/setupTypeScript.js`.

Bạn thậm chí có thể sử dụng `degit` để tải xuống script. Đó là những gì chúng ta sẽ làm để bắt đầu chuyển ứng dụng sang TypeScript.

> [!NOTE]
> Nhớ rằng bạn có thể chạy `npx degit opensas/mdn-svelte-tutorial/07-typescript-support svelte-todo-typescript` để có được ứng dụng danh sách việc cần làm hoàn chỉnh bằng JavaScript trước khi bắt đầu chuyển nó sang TypeScript.

Vào thư mục gốc của dự án và nhập các lệnh sau:

```bash
npx degit sveltejs/template/scripts scripts       # download script file to a scripts folder

node scripts/setupTypeScript.js                   # run it
# Converted to TypeScript.
```

Bạn sẽ cần chạy lại trình quản lý dependency để bắt đầu.

```bash
npm install                                       # download new dependencies

npm run dev                                       # start the app in development mode
```

Các hướng dẫn này áp dụng cho bất kỳ dự án Svelte nào bạn muốn chuyển sang TypeScript. Chỉ cần lưu ý rằng cộng đồng Svelte liên tục cải thiện hỗ trợ Svelte TypeScript, vì vậy bạn nên chạy `npm update` thường xuyên để tận dụng các thay đổi mới nhất.

> [!NOTE]
> Nếu bạn gặp bất kỳ vấn đề nào khi làm việc với TypeScript bên trong ứng dụng Svelte, hãy xem [phần khắc phục sự cố/FAQ về hỗ trợ TypeScript](https://github.com/sveltejs/language-tools/blob/master/docs/preprocessors/typescript.md#troubleshooting--faq).

Như chúng ta đã nói trước, TypeScript là superset của JavaScript, vì vậy ứng dụng của bạn sẽ chạy mà không cần sửa đổi. Hiện tại bạn đang chạy một ứng dụng JavaScript thông thường với hỗ trợ TypeScript được bật, mà không tận dụng bất kỳ tính năng nào TypeScript cung cấp. Bây giờ bạn có thể bắt đầu thêm kiểu dần dần.

Sau khi bạn đã cấu hình TypeScript, bạn có thể bắt đầu sử dụng nó từ một thành phần Svelte bằng cách chỉ thêm `<script lang='ts'>` vào đầu phần script. Để sử dụng nó từ các tệp JavaScript thông thường, chỉ cần thay đổi phần mở rộng tệp từ `.js` sang `.ts`. Bạn cũng sẽ phải cập nhật bất kỳ câu lệnh import tương ứng nào để xóa phần mở rộng tệp `.ts` khỏi tất cả các câu lệnh `import`.

> [!NOTE]
> TypeScript sẽ báo lỗi nếu bạn sử dụng phần mở rộng tệp `.ts` trong câu lệnh `import`, vì vậy nếu bạn có tệp `./foo.ts`, bạn phải import nó là "./foo".
> Xem phần [Module resolution for bundlers, TypeScript runtimes, and Node.js loaders](https://www.typescriptlang.org/docs/handbook/modules/theory.html#module-resolution-for-bundlers-typescript-runtimes-and-nodejs-loaders) của tài liệu TypeScript để biết thêm thông tin.

> [!NOTE]
> Việc sử dụng TypeScript trong các phần markup của thành phần không được hỗ trợ trong Svelte 4, mà hướng dẫn này dựa trên.
> Vì vậy trong khi bạn có thể sử dụng JavaScript từ markup, bạn sẽ phải sử dụng TypeScript trong phần `<script lang='ts'>`.
> TypeScript trong markup của thành phần được cho phép từ Svelte 5.

## Trải nghiệm lập trình được cải thiện với TypeScript

TypeScript cung cấp cho các code editor và IDE nhiều thông tin để cho phép chúng mang lại trải nghiệm phát triển thân thiện hơn.

Chúng ta sẽ sử dụng [Visual Studio Code](https://code.visualstudio.com/) để thực hiện kiểm thử nhanh và xem cách chúng ta có thể nhận được gợi ý tự động hoàn thành và kiểm tra kiểu khi chúng ta viết các thành phần.

> [!NOTE]
> Nếu bạn không muốn sử dụng VS Code, chúng ta cũng cung cấp hướng dẫn sử dụng kiểm tra lỗi TypeScript từ terminal thay thế, một chút sau trong bài viết.

Có công việc đang tiến hành để hỗ trợ TypeScript trong các dự án Svelte trong một số code editor; hỗ trợ đầy đủ nhất cho đến nay có sẵn trong [extension Svelte for VS Code](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode), được phát triển và duy trì bởi nhóm Svelte. Extension này cung cấp kiểm tra kiểu, kiểm tra, tái cấu trúc, intellisense, thông tin hover, tự động hoàn thành và các tính năng khác. Loại hỗ trợ lập trình viên này là một lý do tốt khác để bắt đầu sử dụng TypeScript trong các dự án của bạn.

> [!NOTE]
> Hãy chắc chắn rằng bạn đang sử dụng [Svelte for VS Code](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode) và KHÔNG phải "Svelte" cũ của James Birtles, đã bị ngừng hỗ trợ. Trong trường hợp bạn đã cài đặt nó, bạn nên gỡ cài đặt và cài đặt extension Svelte chính thức thay thế.

Giả sử bạn đang ở trong ứng dụng VS Code, từ thư mục gốc của dự án, gõ `code .` (dấu chấm ở cuối cho VS Code biết để mở thư mục hiện tại) để mở code editor. VS Code sẽ cho bạn biết rằng có các extension được đề xuất để cài đặt.

![Dialog box saying this workspace has extension recommendations, with options to install or show a list](01-vscode-extension-recommendations.png)

Nhấp _Install all_ sẽ cài đặt Svelte for VS Code.

![Svelte for VS Code extension information](02-svelte-for-vscode.png)

Chúng ta cũng có thể thấy rằng tệp `setupTypeScript.js` đã thực hiện một vài thay đổi cho dự án của chúng ta. Tệp `main.js` đã được đổi tên thành `main.ts`, có nghĩa là VS Code có thể cung cấp thông tin hover trên các thành phần Svelte của chúng ta:

![VS Code screenshot showing that when hovering on a component, it gives you hints](03-vscode-hints-in-main-ts.png)

<!-- cSpell:ignore traget -->

Chúng ta cũng nhận được kiểm tra kiểu miễn phí. Nếu chúng ta truyền một thuộc tính không xác định trong tham số options của hàm tạo `App` (ví dụ một lỗi đánh máy như `traget` thay vì `target`), TypeScript sẽ báo lỗi:

![Type checking in VS Code - App object has been given an unknown property traget](04-vscode-type-checking-in-main-ts.png)

Trong thành phần `App.svelte`, script `setupTypeScript.js` đã thêm thuộc tính `lang="ts"` vào thẻ `<script>`. Hơn nữa, nhờ suy luận kiểu, trong nhiều trường hợp chúng ta thậm chí không cần phải chỉ định kiểu để nhận hỗ trợ code. Ví dụ, nếu bạn bắt đầu thêm thuộc tính `ms` vào lời gọi thành phần `Alert`, TypeScript sẽ suy luận từ giá trị mặc định rằng thuộc tính `ms` phải là một số:

![VS Code type inference and code hinting - ms variable should be a number](05-vscode-type-inference-and-code-assistance.png)

Và nếu bạn truyền một thứ gì đó không phải là số, nó sẽ phàn nàn về điều đó:

![Type checking in VS Code - the ms variable has been given a non-numeric value](06-vscode-type-checking-in-components.png)

Template ứng dụng có một script `check` được cấu hình để chạy `svelte-check` với code của bạn. Package này cho phép bạn phát hiện lỗi và cảnh báo thường hiển thị bởi code editor từ dòng lệnh, điều này làm cho nó khá hữu ích để chạy trong pipeline {{glossary("continuous integration")}} (CI). Chỉ cần chạy `npm run check` để kiểm tra CSS không được sử dụng, và trả về gợi ý A11y và lỗi biên dịch TypeScript.

Trong trường hợp này, nếu bạn chạy `npm run check` (trong console VS Code hoặc terminal) bạn sẽ nhận được lỗi sau:

![Check command being run inside VS Code showing type error, ms variable should be assigned a number](07-vscode-svelte-check.png)

Thậm chí tốt hơn, nếu bạn chạy nó từ terminal tích hợp VS Code (bạn có thể mở nó bằng phím tắt <kbd>Ctrl</kbd> + <kbd>\`</kbd>), <kbd>Cmd</kbd>/<kbd>Ctrl</kbd> nhấp vào tên tệp sẽ đưa bạn đến dòng chứa lỗi.

Bạn cũng có thể chạy script `check` ở chế độ watch với `npm run check -- --watch`. Trong trường hợp này, script sẽ thực thi bất cứ khi nào bạn thay đổi bất kỳ tệp nào. Nếu bạn đang chạy điều này trong terminal thông thường, hãy giữ nó chạy trong nền trong một cửa sổ terminal riêng biệt để nó có thể tiếp tục báo cáo lỗi nhưng sẽ không cản trở việc sử dụng terminal khác.

## Tạo kiểu tùy chỉnh

TypeScript hỗ trợ structural typing. Structural typing là một cách liên kết các kiểu dựa trên các thành viên của chúng, ngay cả khi bạn không khai báo kiểu một cách rõ ràng.

Chúng ta sẽ định nghĩa kiểu `TodoType` để xem cách TypeScript đảm bảo rằng bất cứ thứ gì được truyền đến một thành phần mong đợi `TodoType` sẽ tương thích về mặt cấu trúc với nó.

1. Bên trong thư mục `src`, tạo thư mục `types`.
2. Thêm tệp `todo.type.ts` vào trong nó.
3. Cung cấp cho `todo.type.ts` nội dung sau:

   ```ts
   export type TodoType = {
     id: number;
     name: string;
     completed: boolean;
   };
   ```

   > [!NOTE]
   > Template Svelte sử dụng [svelte-preprocess](https://github.com/sveltejs/svelte-preprocess) 4.0.0 để hỗ trợ TypeScript. Từ phiên bản đó trở đi, bạn phải sử dụng cú pháp `export`/`import` type để import kiểu và interface. Xem [phần này của hướng dẫn khắc phục sự cố](https://github.com/sveltejs/language-tools/blob/master/docs/preprocessors/typescript.md#how-do-i-import-interfaces-into-my-svelte-components-i-get-errors-after-transpilation) để biết thêm thông tin.

4. Bây giờ chúng ta sẽ sử dụng `TodoType` từ thành phần `Todo.svelte`. Đầu tiên thêm `lang="ts"` vào thẻ `<script>`.
5. Hãy `import` kiểu và sử dụng nó để khai báo thuộc tính `todo`. Thay thế dòng `export let todo` bằng cách sau:

   ```ts
   import type { TodoType } from "../types/todo.type";

   export let todo: TodoType;
   ```

   Lưu ý rằng phần mở rộng tệp `.ts` không được phép trong câu lệnh `import`, và đã được bỏ qua.

6. Bây giờ từ `Todos.svelte`, chúng ta sẽ khởi tạo một thành phần `Todo` với một đối tượng nghĩa đen làm tham số trước lời gọi thành phần `MoreActions`, như thế này:

   ```svelte
   <hr />

   <Todo todo={ { name: 'a new task with no id!', completed: false } } />

   <!-- MoreActions -->
   <MoreActions {todos}
   ```

7. Thêm `lang='ts'` vào thẻ `<script>` của thành phần `Todos.svelte` để nó biết cách sử dụng kiểm tra kiểu mà chúng ta đã chỉ định.

   Chúng ta sẽ nhận được lỗi sau:

   ![Type error in VS Code, Todo Type object requires an id property.](08-vscode-structural-typing.png)

Bây giờ bạn nên có ý tưởng về loại hỗ trợ chúng ta có thể nhận được từ TypeScript khi xây dựng các dự án Svelte.

Bây giờ chúng ta sẽ hoàn tác các thay đổi này để bắt đầu chuyển ứng dụng sang TypeScript, vì vậy chúng ta sẽ không bị phiền bởi tất cả các cảnh báo kiểm tra.

1. Xóa việc cần làm bị lỗi và thuộc tính `lang='ts'` khỏi tệp `Todos.svelte`.
2. Cũng xóa import của `TodoType` và `lang='ts'` khỏi `Todo.svelte`.

Chúng ta sẽ xử lý chúng đúng cách sau.

## Chuyển ứng dụng danh sách việc cần làm sang TypeScript

Bây giờ chúng ta đã sẵn sàng để bắt đầu chuyển ứng dụng danh sách việc cần làm để tận dụng tất cả các tính năng TypeScript cung cấp.

Hãy bắt đầu bằng cách chạy script check ở chế độ watch bên trong thư mục gốc dự án:

```bash
npm run check -- --watch
```

Điều này sẽ xuất ra điều gì đó như sau:

```bash
svelte-check "--watch"

Loading svelte-check in workspace: ./svelte-todo-typescript
Getting Svelte diagnostics...
====================================
svelte-check found no errors and no warnings
```

Lưu ý rằng nếu bạn đang sử dụng code editor hỗ trợ như VS Code, một cách đơn giản để bắt đầu chuyển thành phần Svelte là chỉ cần thêm `<script lang='ts'>` vào đầu thành phần và tìm kiếm các gợi ý ba dấu chấm:

![VS Code screenshot showing that when you add type="ts" to a component, it gives you three dot alert hints](09-vscode-alert-hints.png)

### Alert.svelte

Hãy bắt đầu với thành phần `Alert.svelte`.

1. Thêm `lang="ts"` vào thẻ `<script>` của thành phần `Alert.svelte`. Bạn sẽ thấy một số cảnh báo trong output của script `check`:

   ```bash
   npm run check -- --watch
   ```

   ```plain
   > svelte-check "--watch"

   ./svelte-todo-typescript
   Getting Svelte diagnostics...
   ====================================

   ./svelte-todo-typescript/src/components/Alert.svelte:8:7
   Warn: Variable 'visible' implicitly has an 'any' type, but a better type may be inferred from usage. (ts)
     let visible

   ./svelte-todo-typescript/src/components/Alert.svelte:9:7
   Warn: Variable 'timeout' implicitly has an 'any' type, but a better type may be inferred from usage. (ts)
     let timeout

   ./svelte-todo-typescript/src/components/Alert.svelte:11:28
   Warn: Parameter 'message' implicitly has an 'any' type, but a better type may be inferred from usage. (ts)
   Change = (message, ms) => {

   ./svelte-todo-typescript/src/components/Alert.svelte:11:37
   Warn: Parameter 'ms' implicitly has an 'any' type, but a better type may be inferred from usage. (ts)
   (message, ms) => {
   ```

2. Bạn có thể sửa những điều này bằng cách chỉ định các kiểu tương ứng, như sau:

   ```ts
   export let ms = 3000;

   let visible: boolean;
   let timeout: number;

   const onMessageChange = (message: string, ms: number) => {
     clearTimeout(timeout);
     if (!message) {
       // hide Alert if message is empty
       // …
     }
     // …
   };
   ```

   > [!NOTE]
   > Không cần phải chỉ định kiểu `ms` với `export let ms:number = 3000`, vì TypeScript đã suy luận nó từ giá trị mặc định của nó.

### MoreActions.svelte

Bây giờ chúng ta sẽ làm điều tương tự cho thành phần `MoreActions.svelte`.

1. Thêm thuộc tính `lang='ts'`, như trước. TypeScript sẽ cảnh báo chúng ta về prop `todos` và biến `t` trong lời gọi `todos.filter((t) =>...)`.

   ```plain
   Warn: Variable 'todos' implicitly has an 'any' type, but a better type may be inferred from usage. (ts)
     export let todos

   Warn: Parameter 't' implicitly has an 'any' type, but a better type may be inferred from usage. (ts)
     $: completedTodos = todos.filter((t) => t.completed).length
   ```

2. Chúng ta sẽ sử dụng `TodoType` đã định nghĩa để cho TypeScript biết rằng `todos` là mảng `TodoType`. Thay thế dòng `export let todos` bằng cách sau:

   ```ts
   import type { TodoType } from "../types/todo.type";

   export let todos: TodoType[];
   ```

Lưu ý rằng bây giờ TypeScript có thể suy luận rằng biến `t` trong `todos.filter((t) => t.completed)` là kiểu `TodoType`. Tuy nhiên, nếu chúng ta nghĩ rằng điều đó làm cho code dễ đọc hơn, chúng ta có thể chỉ định nó như thế này:

```ts
$: completedTodos = todos.filter((t: TodoType) => t.completed).length;
```

Hầu hết thời gian, TypeScript sẽ có thể suy luận chính xác kiểu biến phản ứng, nhưng đôi khi bạn có thể nhận được lỗi "implicitly has an 'any' type" khi làm việc với các phép gán phản ứng. Trong những trường hợp đó, bạn có thể khai báo biến được kiểu hóa trong một câu lệnh khác, như thế này:

```ts
let completedTodos: number;
$: completedTodos = todos.filter((t: TodoType) => t.completed).length;
```

Bạn không thể chỉ định kiểu trong chính phép gán phản ứng. Câu lệnh `$: completedTodos: number = todos.filter[...]` không hợp lệ. Để biết thêm thông tin, hãy đọc [How do I type reactive assignments? / I get an "implicitly has type 'any' error"](https://github.com/sveltejs/language-tools/blob/master/docs/preprocessors/typescript.md#how-do-i-type-reactive-assignments--i-get-an-implicitly-has-type-any-error).

### FilterButton.svelte

Bây giờ chúng ta sẽ xử lý thành phần `FilterButton`.

1. Thêm thuộc tính `lang='ts'` vào thẻ `<script>`, như thường lệ. Bạn sẽ nhận thấy không có cảnh báo — TypeScript suy luận kiểu của biến filter từ giá trị mặc định. Nhưng chúng ta biết rằng chỉ có ba giá trị hợp lệ cho filter: all, active, và completed. Vì vậy chúng ta có thể cho TypeScript biết về chúng bằng cách tạo enum Filter.
2. Tạo tệp `filter.enum.ts` trong thư mục `types`.
3. Cung cấp cho nó nội dung sau:

   ```ts
   export enum Filter {
     ALL = "all",
     ACTIVE = "active",
     COMPLETED = "completed",
   }
   ```

4. Bây giờ chúng ta sẽ sử dụng điều này từ thành phần `FilterButton`. Thay thế nội dung của tệp `FilterButton.svelte` bằng cách sau:

   ```svelte
   <!-- components/FilterButton.svelte -->
   <script lang="ts">
     import { Filter } from "../types/filter.enum";

     export let filter: Filter = Filter.ALL;
   </script>

   <div class="filters btn-group stack-exception">
     <button class="btn toggle-btn" class:btn__primary={filter === Filter.ALL} aria-pressed={filter === Filter.ALL} on:click={()=> filter = Filter.ALL} >
       <span class="visually-hidden">Show</span>
       <span>All</span>
       <span class="visually-hidden">tasks</span>
     </button>
     <button class="btn toggle-btn" class:btn__primary={filter === Filter.ACTIVE} aria-pressed={filter === Filter.ACTIVE} on:click={()=> filter = Filter.ACTIVE} >
       <span class="visually-hidden">Show</span>
       <span>Active</span>
       <span class="visually-hidden">tasks</span>
     </button>
     <button class="btn toggle-btn" class:btn__primary={filter === Filter.COMPLETED} aria-pressed={filter === Filter.COMPLETED} on:click={()=> filter = Filter.COMPLETED} >
       <span class="visually-hidden">Show</span>
       <span>Completed</span>
       <span class="visually-hidden">tasks</span>
     </button>
   </div>
   ```

Ở đây chúng ta chỉ import enum `Filter` và sử dụng nó thay vì các giá trị chuỗi chúng ta đã sử dụng trước đây.

### Todos.svelte

Chúng ta cũng sẽ sử dụng enum `Filter` trong thành phần `Todos.svelte`.

1. Đầu tiên, thêm thuộc tính `lang='ts'` vào nó, như trước.
2. Tiếp theo, import enum `Filter`. Thêm câu lệnh `import` sau bên dưới các câu lệnh hiện có:

   ```js
   import { Filter } from "../types/filter.enum";
   ```

3. Bây giờ chúng ta sẽ sử dụng nó bất cứ khi nào chúng ta tham chiếu filter hiện tại. Thay thế hai khối liên quan đến filter bằng cách sau:

   ```ts
   let filter: Filter = Filter.ALL;
   const filterTodos = (filter: Filter, todos) =>
     filter === Filter.ACTIVE
       ? todos.filter((t) => !t.completed)
       : filter === Filter.COMPLETED
         ? todos.filter((t) => t.completed)
         : todos;

   $: {
     if (filter === Filter.ALL) {
       $alert = "Browsing all todos";
     } else if (filter === Filter.ACTIVE) {
       $alert = "Browsing active todos";
     } else if (filter === Filter.COMPLETED) {
       $alert = "Browsing completed todos";
     }
   }
   ```

4. `check` vẫn sẽ cho chúng ta một số cảnh báo từ `Todos.svelte`. Hãy sửa chúng.

   Bắt đầu bằng cách import `TodoType` và cho TypeScript biết rằng biến `todos` là mảng `TodoType`. Thay thế `export let todos = []` bằng hai dòng sau:

   ```ts
   import type { TodoType } from "../types/todo.type";

   export let todos: TodoType[] = [];
   ```

5. Tiếp theo chúng ta sẽ chỉ định tất cả các kiểu còn thiếu. Biến `todosStatus`, mà chúng ta đã sử dụng để truy cập lập trình các phương thức được hiển thị bởi thành phần `TodosStatus`, là kiểu `TodosStatus`. Và mỗi `todo` sẽ là kiểu `TodoType`.

   Cập nhật phần `<script>` để trông như thế này:

   ```ts
   import FilterButton from "./FilterButton.svelte";
   import Todo from "./Todo.svelte";
   import MoreActions from "./MoreActions.svelte";
   import NewTodo from "./NewTodo.svelte";
   import type TodosStatus from "./TodosStatus.svelte";
   import { alert } from "../stores";

   import { Filter } from "../types/filter.enum";

   import type { TodoType } from "../types/todo.type";

   export let todos: TodoType[] = [];

   let todosStatus: TodosStatus; // reference to TodosStatus instance

   $: newTodoId =
     todos.length > 0 ? Math.max(...todos.map((t) => t.id)) + 1 : 1;

   function addTodo(name: string) {
     todos = [...todos, { id: newTodoId, name, completed: false }];
     $alert = `Todo '${name}' has been added`;
   }

   function removeTodo(todo: TodoType) {
     todos = todos.filter((t) => t.id !== todo.id);
     todosStatus.focus(); // give focus to status heading
     $alert = `Todo '${todo.name}' has been deleted`;
   }

   function updateTodo(todo: TodoType) {
     const i = todos.findIndex((t) => t.id === todo.id);
     if (todos[i].name !== todo.name)
       $alert = `todo '${todos[i].name}' has been renamed to '${todo.name}'`;
     if (todos[i].completed !== todo.completed)
       $alert = `todo '${todos[i].name}' marked as ${
         todo.completed ? "completed" : "active"
       }`;
     todos[i] = { ...todos[i], ...todo };
   }

   let filter: Filter = Filter.ALL;
   const filterTodos = (filter: Filter, todos: TodoType[]) =>
     filter === Filter.ACTIVE
       ? todos.filter((t) => !t.completed)
       : filter === Filter.COMPLETED
         ? todos.filter((t) => t.completed)
         : todos;

   $: {
     if (filter === Filter.ALL) {
       $alert = "Browsing all todos";
     } else if (filter === Filter.ACTIVE) {
       $alert = "Browsing active todos";
     } else if (filter === Filter.COMPLETED) {
       $alert = "Browsing completed todos";
     }
   }

   const checkAllTodos = (completed: boolean) => {
     todos = todos.map((t) => ({ ...t, completed }));
     $alert = `${completed ? "Checked" : "Unchecked"} ${todos.length} todos`;
   };
   const removeCompletedTodos = () => {
     $alert = `Removed ${todos.filter((t) => t.completed).length} todos`;
     todos = todos.filter((t) => !t.completed);
   };
   ```

### TodosStatus.svelte

Chúng ta đang gặp phải các lỗi sau liên quan đến việc truyền `todos` đến các thành phần `TodosStatus.svelte` (và `Todo.svelte`):

```plain
./src/components/Todos.svelte:70:39
Error: Type 'TodoType[]' is not assignable to type 'undefined'. (ts)
  <TodosStatus bind:this={todosStatus} {todos} />

./src/components/Todos.svelte:76:12
Error: Type 'TodoType' is not assignable to type 'undefined'. (ts)
     <Todo {todo}
```

Điều này là do prop `todos` trong thành phần `TodosStatus` không có giá trị mặc định, vì vậy TypeScript đã suy luận nó là kiểu `undefined`, không tương thích với mảng `TodoType`. Điều tương tự cũng đang xảy ra với thành phần Todo.

Hãy sửa điều này.

1. Mở tệp `TodosStatus.svelte` và thêm thuộc tính `lang='ts'`.
2. Sau đó import `TodoType` và khai báo prop `todos` là mảng `TodoType`. Thay thế dòng đầu tiên của phần `<script>` bằng cách sau:

   ```ts
   import type { TodoType } from "../types/todo.type";

   export let todos: TodoType[];
   ```

3. Chúng ta cũng sẽ chỉ định `headingEl`, mà chúng ta đã sử dụng để bind với thẻ heading, là `HTMLElement`. Cập nhật dòng `let headingEl` bằng cách sau:

   ```ts
   let headingEl: HTMLElement;
   ```

4. Cuối cùng, bạn sẽ nhận thấy lỗi sau được báo cáo, liên quan đến nơi chúng ta đặt thuộc tính `tabindex`. Đó là vì TypeScript đang kiểm tra kiểu phần tử `<h2>` và mong đợi `tabindex` là kiểu `number`.

   ![Tabindex hint inside VS Code, tabindex expects a type of number, not string](10-vscode-tabindex-hint.png)

   Để sửa điều này, thay thế `tabindex="-1"` bằng `tabindex={-1}`, như thế này:

   ```svelte
   <h2 id="list-heading" bind:this={headingEl} tabindex={-1}>
     {completedTodos} out of {totalTodos} items completed
   </h2>
   ```

   Bằng cách này TypeScript có thể ngăn chúng ta gán không chính xác nó vào biến chuỗi.

### NewTodo.svelte

Tiếp theo chúng ta sẽ xử lý `NewTodo.svelte`.

1. Như thường lệ, thêm thuộc tính `lang='ts'`.
2. Cảnh báo sẽ cho biết rằng chúng ta phải chỉ định kiểu cho biến `nameEl`. Đặt kiểu của nó thành `HTMLElement` như thế này:

   ```ts
   let nameEl: HTMLElement; // reference to the name input DOM node
   ```

3. Cuối cùng cho tệp này, chúng ta cần chỉ định kiểu chính xác cho biến `autofocus`. Cập nhật định nghĩa của nó như thế này:

   ```ts
   export let autofocus: boolean = false;
   ```

### Todo.svelte

Bây giờ cảnh báo duy nhất mà `npm run check` phát ra được kích hoạt bởi việc gọi thành phần `Todo.svelte`. Hãy sửa chúng.

1. Mở tệp `Todo.svelte` và thêm thuộc tính `lang='ts'`.
2. Hãy import `TodoType` và đặt kiểu của prop `todo`. Thay thế dòng `export let todo` bằng cách sau:

   ```ts
   import type { TodoType } from "../types/todo.type";

   export let todo: TodoType;
   ```

3. Cảnh báo đầu tiên chúng ta nhận được là TypeScript yêu cầu chúng ta định nghĩa kiểu của biến `updatedTodo` của hàm `update()`. Điều này có thể hơi phức tạp vì `updatedTodo` chỉ chứa các thuộc tính của `todo` đã được cập nhật. Điều đó có nghĩa là nó không phải là `todo` hoàn chỉnh — nó chỉ có một tập hợp con các thuộc tính của `todo`.

   Đối với những trường hợp này, TypeScript cung cấp một số [utility types](https://www.typescriptlang.org/docs/handbook/utility-types.html) để làm cho việc áp dụng các biến đổi phổ biến này dễ dàng hơn. Điều chúng ta cần lúc này là utility [`Partial<T>`](https://www.typescriptlang.org/docs/handbook/utility-types.html#partialt), cho phép chúng ta đại diện cho tất cả các tập hợp con của một kiểu đã cho. Utility partial trả về một kiểu mới dựa trên kiểu `T`, trong đó mỗi thuộc tính của `T` là tùy chọn.

   Chúng ta sẽ sử dụng nó trong hàm `update()` — cập nhật hàm của bạn như sau:

   ```ts
   function update(updatedTodo: Partial<TodoType>) {
     todo = { ...todo, ...updatedTodo }; // applies modifications to todo
     dispatch("update", todo); // emit update event
   }
   ```

   Với điều này, chúng ta đang cho TypeScript biết rằng biến `updatedTodo` sẽ chứa một tập hợp con các thuộc tính `TodoType`.

4. Bây giờ svelte-check cho chúng ta biết rằng chúng ta phải định nghĩa kiểu của các tham số hàm action:

   ```bash
   ./07-next-steps/src/components/Todo.svelte:45:24
   Warn: Parameter 'node' implicitly has an 'any' type, but a better type may be inferred from usage. (ts)
     const focusOnInit = (node) => node && typeof node.focus === 'function' && node.focus()

   ./07-next-steps/src/components/Todo.svelte:47:28
   Warn: Parameter 'node' implicitly has an 'any' type, but a better type may be inferred from usage. (ts)
     const focusEditButton = (node) => editButtonPressed && node.focus()
   ```

   Chúng ta chỉ cần định nghĩa biến node là kiểu `HTMLElement`. Trong hai dòng được chỉ ra ở trên, thay thế instance đầu tiên của `node` bằng `node: HTMLElement`.

### actions.js

Tiếp theo chúng ta sẽ xử lý tệp `actions.js`.

1. Đổi tên nó thành `actions.ts` và thêm kiểu của tham số node. Nó sẽ kết thúc trông như thế này:

   ```ts
   // actions.ts
   export function selectOnFocus(node: HTMLInputElement) {
     if (node && typeof node.select === "function") {
       // make sure node is defined and has a select() method
       const onFocus = () => node.select(); // event handler
       node.addEventListener("focus", onFocus); // when node gets focus call onFocus()
       return {
         destroy: () => node.removeEventListener("focus", onFocus), // this will be executed when the node is removed from the DOM
       };
     }
   }
   ```

2. Bây giờ cập nhật `Todo.svelte` và `NewTodo.svelte` nơi chúng ta import tệp actions. Nhớ rằng các import trong TypeScript không bao gồm phần mở rộng tệp. Trong mỗi trường hợp nó sẽ kết thúc như thế này:

   ```js
   import { selectOnFocus } from "../actions";
   ```

### Chuyển stores sang TypeScript

Bây giờ chúng ta phải chuyển các tệp `stores.js` và `localStore.js` sang TypeScript.

Mẹo: script `npm run check`, sử dụng công cụ [`svelte-check`](https://github.com/sveltejs/language-tools/tree/master/packages/svelte-check), chỉ kiểm tra các tệp `.svelte` của ứng dụng. Nếu bạn cũng muốn kiểm tra các tệp `.ts`, bạn có thể chạy `npm run check && npx tsc --noEmit`, điều này yêu cầu trình biên dịch TypeScript kiểm tra lỗi mà không tạo ra các tệp đầu ra `.js`. Bạn thậm chí có thể thêm một script vào tệp `package.json` của bạn chạy lệnh đó.

Chúng ta sẽ bắt đầu với `stores.js`.

1. Đổi tên tệp thành `stores.ts`.
2. Đặt kiểu của mảng `initialTodos` thành `TodoType[]`. Đây là cách nội dung sẽ kết thúc:

   ```ts
   // stores.ts
   import { writable } from "svelte/store";
   import { localStore } from "./localStore.js";
   import type { TodoType } from "./types/todo.type";

   export const alert = writable("Welcome to the To-Do list app!");

   const initialTodos: TodoType[] = [
     { id: 1, name: "Visit MDN web docs", completed: true },
     { id: 2, name: "Complete the Svelte Tutorial", completed: false },
   ];

   export const todos = localStore("mdn-svelte-todo", initialTodos);
   ```

3. Nhớ cập nhật các câu lệnh `import` trong `App.svelte`, `Alert.svelte`, và `Todos.svelte`. Chỉ cần xóa phần mở rộng `.js`, như thế này:

   ```js
   import { todos } from "../stores";
   ```

Bây giờ chuyển sang `localStore.js`.

Cập nhật câu lệnh `import` trong `stores.ts` như sau:

```js
import { localStore } from "./localStore";
```

1. Bắt đầu bằng cách đổi tên tệp thành `localStore.ts`.
2. TypeScript đang yêu cầu chúng ta chỉ định kiểu của các biến `key`, `initial`, và `value`. Cái đầu tiên thì dễ: key của web storage cục bộ phải là chuỗi.

   Nhưng `initial` và `value` nên là bất kỳ đối tượng nào có thể được chuyển đổi sang chuỗi JSON hợp lệ với phương thức [`JSON.stringify`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify), có nghĩa là bất kỳ đối tượng JavaScript nào với một vài hạn chế: ví dụ, `undefined`, hàm, và symbol không phải là các giá trị JSON hợp lệ.

   Vì vậy, chúng ta sẽ tạo kiểu `JsonValue` để chỉ định các điều kiện này.

   Tạo tệp `json.type.ts` trong thư mục `types`.

3. Cung cấp cho nó nội dung sau:

   ```ts
   export type JsonValue =
     | string
     | number
     | boolean
     | null
     | JsonValue[]
     | { [key: string]: JsonValue };
   ```

   Toán tử `|` cho phép chúng ta khai báo các biến có thể lưu giá trị của hai hoặc nhiều kiểu. `JsonValue` có thể là chuỗi, số, boolean, v.v. Trong trường hợp này chúng ta cũng sử dụng kiểu đệ quy để chỉ định rằng `JsonValue` có thể có mảng `JsonValue` và cũng là đối tượng với các thuộc tính kiểu `JsonValue`.

4. Chúng ta sẽ import kiểu `JsonValue` và sử dụng nó phù hợp. Cập nhật tệp `localStore.ts` của bạn như thế này:

   ```ts
   // localStore.ts
   import { writable } from "svelte/store";

   import type { JsonValue } from "./types/json.type";

   export const localStore = (key: string, initial: JsonValue) => {
     // receives the key of the local storage and an initial value

     const toString = (value: JsonValue) => JSON.stringify(value, null, 2); // helper function
     const toObj = JSON.parse; // helper function

     if (localStorage.getItem(key) === null) {
       // item not present in local storage
       localStorage.setItem(key, toString(initial)); // initialize local storage with initial value
     }

     const saved = toObj(localStorage.getItem(key)); // convert to object

     const { subscribe, set, update } = writable(saved); // create the underlying writable store

     return {
       subscribe,
       set(value: JsonValue) {
         localStorage.setItem(key, toString(value)); // save also to local storage as a string
         return set(value);
       },
       update,
     };
   };
   ```

Bây giờ nếu chúng ta cố gắng tạo `localStore` với thứ gì đó không thể chuyển đổi sang JSON qua `JSON.stringify()`, ví dụ một đối tượng với một hàm là thuộc tính, VS Code/`validate` sẽ báo lỗi:

![VS Code showing an error with using our store — it fails when trying to set a local storage value to something incompatible with JSON stringify](11-vscode-invalid-store.png)

Và tốt nhất là, nó thậm chí sẽ hoạt động với [cú pháp `$store` auto-subscription](https://svelte.dev/docs/svelte-components#script-4-prefix-stores-with-$-to-access-their-values). Nếu chúng ta cố gắng lưu một giá trị không hợp lệ vào store `todos` bằng cú pháp `$store`, như thế này:

```svelte
<!-- App.svelte -->
<script lang="ts">
  import Todos from "./components/Todos.svelte";
  import Alert from "./components/Alert.svelte";

  import { todos } from "./stores";

  // this is invalid, the content cannot be converted to JSON using JSON.stringify
  $todos = { handler: () => {} };
</script>
```

Script check sẽ báo lỗi sau:

```bash
> npm run check

Getting Svelte diagnostics...
====================================

./svelte-todo-typescript/src/App.svelte:8:12
Error: Argument of type '{ handler: () => void; }' is not assignable to parameter of type 'JsonValue'.
  Types of property 'handler' are incompatible.
    Type '() => void' is not assignable to type 'JsonValue'.
      Type '() => void' is not assignable to type '{ [key: string]: JsonValue; }'.
        Index signature is missing in type '() => void'. (ts)
 $todos = { handler: () => {} }
```

Đây là một ví dụ khác về cách chỉ định kiểu có thể làm cho code của chúng ta mạnh mẽ hơn và giúp chúng ta phát hiện nhiều lỗi hơn trước khi chúng vào production.

Và đó là tất cả. Chúng ta đã chuyển đổi toàn bộ ứng dụng để sử dụng TypeScript.

## Bảo vệ stores với Generics

Các store của chúng ta đã được chuyển sang TypeScript, nhưng chúng ta có thể làm tốt hơn. Chúng ta không cần phải lưu trữ bất kỳ loại giá trị nào — chúng ta biết rằng store alert nên chứa các tin nhắn chuỗi, và store to-dos nên chứa một mảng `TodoType`, v.v. Chúng ta có thể để TypeScript thực thi điều này bằng cách sử dụng [TypeScript Generics](https://www.typescriptlang.org/docs/handbook/generics.html). Hãy tìm hiểu thêm.

### Hiểu về TypeScript Generics

Generics cho phép bạn tạo các thành phần code có thể tái sử dụng hoạt động với nhiều kiểu thay vì một kiểu duy nhất. Chúng có thể được áp dụng cho interface, class, và hàm. Kiểu generic được truyền dưới dạng tham số bằng cú pháp đặc biệt: chúng được chỉ định trong dấu ngoặc nhọn và theo quy ước được ký hiệu bằng một chữ cái hoa đơn. Kiểu generic cho phép bạn nắm bắt các kiểu được người dùng cung cấp, đảm bảo chúng có sẵn cho việc xử lý sau.

Hãy xem một ví dụ nhanh, một class `Stack` đơn giản cho phép chúng ta `push` và `pop` các phần tử, như thế này:

```ts
export class Stack {
  private elements = [];

  push = (element) => this.elements.push(element);

  pop() {
    if (this.elements.length === 0) throw new Error("The stack is empty!");
    return this.elements.pop();
  }
}
```

Trong trường hợp này `elements` là mảng kiểu `any`, và tương ứng các phương thức `push()` và `pop()` đều nhận và trả về một biến kiểu `any`. Vì vậy hoàn toàn hợp lệ khi làm điều gì đó như sau:

```js
const anyStack = new Stack();

anyStack.push(1);
anyStack.push("hello");
```

Nhưng nếu chúng ta muốn có một `Stack` chỉ hoạt động với kiểu `string` thì sao? Chúng ta có thể làm như sau:

```ts
export class StringStack {
  private elements: string[] = [];

  push = (element: string) => this.elements.push(element);

  pop(): string {
    if (this.elements.length === 0) throw new Error("The stack is empty!");
    return this.elements.pop();
  }
}
```

Điều đó sẽ hoạt động. Nhưng nếu chúng ta muốn làm việc với số, chúng ta sẽ phải nhân đôi code và tạo class `NumberStack`. Và làm thế nào chúng ta có thể xử lý một stack của các kiểu chúng ta chưa biết và nên được định nghĩa bởi người tiêu dùng?

Để giải quyết tất cả những vấn đề này, chúng ta có thể sử dụng generics.

Đây là class `Stack` được tái triển khai bằng cách sử dụng generics:

```ts
export class Stack<T> {
  private elements: T[] = [];

  push = (element: T): number => this.elements.push(element);

  pop(): T {
    if (this.elements.length === 0) throw new Error("The stack is empty!");
    return this.elements.pop();
  }
}
```

Chúng ta định nghĩa kiểu generic `T` và sau đó sử dụng nó như chúng ta thường sử dụng một kiểu cụ thể. Bây giờ elements là mảng kiểu `T`, và `push()` và `pop()` đều nhận và trả về một biến kiểu `T`.

Đây là cách chúng ta sẽ sử dụng `Stack` generic:

```ts
const numberStack = new Stack<number>();
numberStack.push(1);
```

Bây giờ TypeScript biết rằng stack của chúng ta chỉ có thể chấp nhận số, và sẽ phát lỗi nếu chúng ta cố gắng push bất cứ thứ gì khác:

![Argument of type hello is not assignable to parameter of type number](12-vscode-generic-stack-error.png)

TypeScript cũng có thể suy luận kiểu generic theo cách sử dụng của nó. Generics cũng hỗ trợ các giá trị mặc định và ràng buộc.

Generics là một tính năng mạnh mẽ cho phép code của chúng ta trừu tượng hóa khỏi các kiểu cụ thể được sử dụng, làm cho nó có thể tái sử dụng và chung chung hơn mà không từ bỏ an toàn kiểu. Để tìm hiểu thêm về nó, hãy xem [TypeScript Introduction to Generics](https://www.typescriptlang.org/docs/handbook/generics.html).

### Sử dụng Svelte stores với generics

Svelte stores hỗ trợ generics ngay lập tức. Và, vì suy luận kiểu generic, chúng ta có thể tận dụng nó mà thậm chí không cần phải chạm vào code của mình.

Nếu bạn mở tệp `Todos.svelte` và gán kiểu `number` cho store `$alert`, bạn sẽ nhận được lỗi sau:

![Argument of type 9999 is not assignable to parameter of type string](13-vscode-generic-alert-error.png)

Đó là vì khi chúng ta định nghĩa store alert trong tệp `stores.ts` với:

```js
export const alert = writable("Welcome to the To-Do list app!");
```

TypeScript đã suy luận kiểu generic là `string`. Nếu chúng ta muốn rõ ràng về điều đó, chúng ta có thể làm như sau:

```ts
export const alert = writable<string>("Welcome to the To-Do list app!");
```

Bây giờ chúng ta sẽ làm cho store `localStore` hỗ trợ generics. Nhớ rằng chúng ta đã định nghĩa kiểu `JsonValue` để ngăn việc sử dụng store `localStore` với các giá trị không thể được lưu trữ bằng `JSON.stringify()`. Bây giờ chúng ta muốn người tiêu dùng `localStore` có thể chỉ định kiểu dữ liệu để lưu trữ, nhưng thay vì làm việc với bất kỳ kiểu nào, chúng nên tuân thủ kiểu `JsonValue`. Chúng ta sẽ chỉ định điều đó với Generic constraint, như thế này:

```ts
export const localStore = <T extends JsonValue>(key: string, initial: T) => {
  // …
};
```

Chúng ta định nghĩa kiểu generic `T` và chỉ định rằng nó phải tương thích với kiểu `JsonValue`. Sau đó chúng ta sẽ sử dụng kiểu `T` phù hợp.

Tệp `localStore.ts` sẽ kết thúc như thế này — hãy thử code mới trong phiên bản của bạn:

```ts
// localStore.ts
import { writable } from "svelte/store";

import type { JsonValue } from "./types/json.type";

export const localStore = <T extends JsonValue>(key: string, initial: T) => {
  // receives the key of the local storage and an initial value

  const toString = (value: T) => JSON.stringify(value, null, 2); // helper function
  const toObj = JSON.parse; // helper function

  if (localStorage.getItem(key) === null) {
    // item not present in local storage
    localStorage.setItem(key, toString(initial)); // initialize local storage with initial value
  }

  const saved = toObj(localStorage.getItem(key)); // convert to object

  const { subscribe, set, update } = writable<T>(saved); // create the underlying writable store

  return {
    subscribe,
    set(value: T) {
      localStorage.setItem(key, toString(value)); // save also to local storage as a string
      return set(value);
    },
    update,
  };
};
```

Và nhờ suy luận kiểu generic, TypeScript đã biết rằng store `$todos` nên chứa mảng `TodoType`:

![Todo Type object property complete should be completed](14-vscode-generic-localstore-error.png)

Một lần nữa, nếu chúng ta muốn rõ ràng về điều đó, chúng ta có thể làm như vậy trong tệp `stores.ts` như thế này:

```ts
const initialTodos: TodoType[] = [
  { id: 1, name: "Visit MDN web docs", completed: true },
  { id: 2, name: "Complete the Svelte Tutorial", completed: false },
];

export const todos = localStore<TodoType[]>("mdn-svelte-todo", initialTodos);
```

Đó là tất cả cho chuyến tham quan ngắn về TypeScript Generics.

## Code cho đến nay

### Git

Để xem trạng thái của code như nó nên là ở cuối bài viết này, truy cập bản sao của repo của bạn như thế này:

```bash
cd mdn-svelte-tutorial/08-next-steps
```

Hoặc tải trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/08-next-steps
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Như chúng ta đã đề cập trước đó, TypeScript chưa có sẵn trong REPL.

## Tóm tắt

Trong bài viết này, chúng ta đã lấy ứng dụng danh sách việc cần làm và chuyển nó sang TypeScript.

Đầu tiên chúng ta đã học về TypeScript và những ưu điểm nó có thể mang lại. Sau đó chúng ta đã thấy cách tạo dự án Svelte mới với hỗ trợ TypeScript. Chúng ta cũng đã thấy cách chuyển đổi dự án Svelte hiện có để sử dụng TypeScript — ứng dụng danh sách việc cần làm.

Chúng ta đã thấy cách làm việc với [Visual Studio Code](https://code.visualstudio.com/) và [extension Svelte](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode) để có được các tính năng như kiểm tra kiểu và tự động hoàn thành. Chúng ta cũng đã sử dụng công cụ `svelte-check` để kiểm tra các vấn đề TypeScript từ dòng lệnh.

Trong bài viết tiếp theo, chúng ta sẽ học cách biên dịch và triển khai ứng dụng lên production. Chúng ta cũng sẽ xem những tài nguyên nào có sẵn trực tuyến để học Svelte sâu hơn.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_stores","Learn_web_development/Core/Frameworks_libraries/Svelte_deployment_next", "Learn_web_development/Core/Frameworks_libraries")}}
