import { useRef, useState, useEffect } from "preact/hooks";

import { Show } from "../../interfaces";
import { IonIcon } from "../../icon";
import { getInjector } from "../../fluent";


let resources = [
    "base"
];

const _ = getInjector(resources);


interface ShowToggleButtonParams {
    show?: Show;
    setValue: any;
    attribute: string;
    onIcon: string;
    offIcon: string;
    onTooltip: string;
    offTooltip: string;
    additionalClasses: string;
    disabled?: boolean;
}


export const ShowToggleButton = ({ show, setValue, attribute, onIcon, offIcon, onTooltip, offTooltip, additionalClasses, disabled }: ShowToggleButtonParams) => {
    const btn = useRef(null);

    let existingState: boolean;
    if (typeof show === "undefined" || show === null)
        existingState = true;
    else
        existingState = show[attribute];

    const [state, setState] = useState(existingState);

    useEffect(() => {
        if (show)
            setState(show[attribute]);
        else
            setState(true);
    }, [show]);

    const setStateOn = () => {
        setState(true);
        setValue(attribute, true);
        if (btn.current)
            btn.current.blur();
    }

    const setStateOff = () => {
        setState(false);
        setValue(attribute, false);
        if (btn.current)
            btn.current.blur();
    }

    if (state) {
        return (
            <button ref={btn} class={"button " + additionalClasses} title={onTooltip} onClick={setStateOff} disabled={disabled}>
                <IonIcon name={onIcon} />
            </button>
        )
    } else {
        return (
            <button ref={btn} class={"button is-outlined " + additionalClasses} title={offTooltip} onClick={setStateOn} disabled={disabled}>
                <IonIcon name={offIcon} />
            </button>
        )
    }
}