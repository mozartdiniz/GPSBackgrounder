using System;
using System.Windows;
using System.Windows.Controls;
using Microsoft.Devices;
using System.Runtime.Serialization;
using System.Threading;
using System.Windows.Resources;
using Microsoft.Phone.Controls;
using Microsoft.Xna.Framework.Audio;
using WPCordovaClassLib.Cordova.UI;
using System.Diagnostics;

namespace WPCordovaClassLib.Cordova.Commands
{
    public class GPSBackgrounder : BaseCommand
    {

        /*
            No iOS, o inicializa instancia o cara quem vai coletar as coordenadas
            não sei como vai ser no WP, pode não implementar nada aqui se não for o caso.
        */
        public void initialize(string options)
        {
            // Se tiver inicializado corretamente, chamar esse cara, ele chama o callback de success.
            // DispatchCommandResult(new PluginResult(PluginResult.Status.OK));

            // Se falhar, chamar esse, ele chama o callback de error.
            // DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, error));           
        }

        /*
            As coordenadas só devem ser coletadas depois do Start Route, nesse ponto 
            o plugin chamar a função start que deve iniciar o processo de coleta de 
            coordenadas em background.
        */
        public void start(string options)
        {
            // Se tiver inicializado corretamente, chamar esse cara, ele chama o callback de success.
            // DispatchCommandResult(new PluginResult(PluginResult.Status.OK));

            // Se falhar, chamar esse, ele chama o callback de error.
            // DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, error));            
        }

        /*
            As coordenadas só devem ser coletadas depois do Start Route, nesse ponto 
            o plugin chamar a função start que deve iniciar o processo de coleta de 
            coordenadas em background.
        */
        public void stop(string options)
        {
            // Se pausar o servico corretamente, chama esse cara
            // DispatchCommandResult(new PluginResult(PluginResult.Status.OK));

            // Se falhar, chamar esse, ele chama o callback de error.
            // DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, error));           
        }  

        /*
            Esse cara é quem vai ficar mandando as coordenadas de volta pro JS
        */
        public void locationManager(string options)
        {                        
            /* 
                A mesma coisa dos outros, se receber coorretamente a coordenada, chamar esse cara

                A resposta dele deve ser um JSON em string.
                "{\"latitude\":0.0, \"longitude\": 0.0, \"speed\": 0.0, \"timestamp\": 323423, \"accuracy\": 30}"
            */    
            // DispatchCommandResult(new PluginResult(PluginResult.Status.OK));

            // Se falhar, chamar esse, ele chama o callback de error.
            // DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, error));             
        }                        
    }
}