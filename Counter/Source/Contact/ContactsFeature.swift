//
//  ContactsFeature.swift
//  Counter
//
//  Created by Lameirão Lima on 30/01/24.
//
import Foundation
import ComposableArchitecture

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

extension ContactsFeature {
    @Reducer
    struct Destination {
        @ObservableState
        enum State: Equatable {
            case addContact(AddContactFeature.State)
            case alert(AlertState<ContactsFeature.Action.Alert>)
        }
        enum Action {
            case addContact(AddContactFeature.Action)
            case alert(ContactsFeature.Action.Alert)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.addContact, action: \.addContact) {
                AddContactFeature()
            }
        }
    }
}


@Reducer
struct ContactsFeature {
    @ObservableState
    struct State: Equatable {
        @Presents var destination: Destination.State?
        //@Presents var addContact: AddContactFeature.State?
        var contacts: IdentifiedArrayOf<Contact> = []
        //@Presents var alert: AlertState<Action.Alert>?
    }
    
    enum Action {
        case addButtonTapped
        case deleteButtonTapped(id: Contact.ID)
        case destination(PresentationAction<Destination.Action>)
        enum Alert: Equatable {
            case confirmDeletion(id: Contact.ID)
        }
    }
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                /* state.addContact = AddContactFeature.State( //ANTES DO DESTINATION
                 contact: Contact(id: UUID(), name: "")
                 )*/
                state.destination = .addContact(
                    AddContactFeature.State(
                        contact: Contact(id: UUID(), name: "")
                    )
                )
                return .none
            case let .destination(.presented(.addContact(.delegate(.saveContact(contact))))):
                if !contact.name.isEmpty {
                    state.contacts.append(contact)
                }
                return .none
                //case let .alert(.presented(.confirmDeletion(id: id)))://ANTES DO DESTINATION
            case let .destination(.presented(.alert(.confirmDeletion(id: id)))):
                state.contacts.remove(id: id)
                return .none
                
            case .destination:
                return .none
                
            case let .deleteButtonTapped(id: id):
                state.destination = .alert(
                    AlertState {
                        TextState("Are you sure?")
                    } actions: {
                        ButtonState(role: .destructive, action: .confirmDeletion(id: id)) {
                            TextState("Delete")
                        }
                    }
                )
                return .none
            }
        }
        /*.ifLet permite executar blocos de código com base na presença de um valor opcional, integrando-se profundamente com a lógica de apresentação de views.*/
        .ifLet(\.$destination, action: \.destination) {
            Destination()
        }
        /*.ifLet(\.$addContact, action: \.addContact) {
         AddContactFeature()
         }
         .ifLet(\.$alert, action: \.alert)*/
    }
}
