module Light = {
    @react.component
    let make = (~color) => {
        <div className=Styles.light(~disabled=color) id="light"></div>
    }
}

module Send = {

    @react.component
    let make = (~placeholder=?, ~setColor) => {
        let sended = (event) => {
            event->ReactEvent.Form.preventDefault
            let value = ReactEvent.Form.currentTarget(event)["input"]["value"]
            let count = ref(0);
            let time = Js.Global.setInterval(() => {
                let tick = switch value->Js.String2.get(count.contents) {
                    | "-" => 0
                    | "." => 1
                    | _ => 2
                }
                count := count.contents + 1
                setColor(_ => tick)
            }, 200)
            Js.Global.setTimeout(() => Js.Global.clearInterval(time),
                value->Js.String.length * 200)->ignore
        }

        <form className=Styles.send onSubmit={sended}>
            <input type_="text" ?placeholder id="input"/>
            <button type_="submit">{"Send"->React.string}</button>
        </form>
    }
}

@react.component
let make = () => {
    let (color, setColor) = React.useState(_ => 0)
    <main className=Styles.main>
        <Send setColor placeholder="Insira aqui seu codigo"></Send>
        <Light color></Light>
    </main>
}