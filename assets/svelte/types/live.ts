type Cb = (reply:any, ref:any) =>  void

export type Live = {
    pushEvent(event: string, payload: unknown, cb?:Cb): void
    pushEventTo(selectorOrTarget: unknown, event: string, payload: unknown, cb?:Cb): void
    handleEvent(event: string, cb?: (payload: unknown) => void): void
    upload(name: string, files: File[]): void
    uploadTo(selectorOrTarget: unknown, name: string, files: File[]): void
}